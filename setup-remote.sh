#!/usr/bin/env bash
set -euo pipefail

echo "==> Enabling SSH & VNC for headless access…"

# Detect username (defaults to 'pi' if not found)
PI_USER="${SUDO_USER:-${USER:-pi}}"

# 1) Prefer raspi-config (if available) for persistent enablement
if command -v raspi-config >/dev/null 2>&1; then
  echo "-> Using raspi-config to enable SSH and VNC"
  sudo raspi-config nonint do_ssh 0 || true
  sudo raspi-config nonint do_vnc 0 || true
else
  echo "-> raspi-config not found; will enable services directly"
fi

# 2) Ensure SSH server is installed & enabled
if ! systemctl list-unit-files | grep -q '^ssh\.service'; then
  echo "-> Installing OpenSSH server"
  sudo apt-get update -y
  sudo apt-get install -y openssh-server
fi
echo "-> Enabling SSH service"
sudo systemctl enable ssh
sudo systemctl start ssh

# 3) Ensure RealVNC server is installed & enabled
# (Raspberry Pi OS usually includes this package name)
if ! systemctl list-unit-files | grep -q '^vncserver-x11-serviced\.service'; then
  echo "-> Installing RealVNC Server"
  sudo apt-get update -y
  sudo apt-get install -y realvnc-vnc-server
fi
echo "-> Enabling VNC service"
sudo systemctl enable vncserver-x11-serviced
sudo systemctl start vncserver-x11-serviced

# 4) Optional: UFW firewall rules (only if ufw is installed or you opt-in)
if command -v ufw >/dev/null 2>&1; then
  echo "-> Configuring UFW to allow SSH (22) and VNC (5900-5999)"
  sudo ufw allow 22/tcp || true
  sudo ufw allow 5900:5999/tcp || true
  sudo ufw reload || true
else
  echo "-> UFW not installed (skipping firewall config)."
  echo "   If you use UFW: sudo apt-get install -y ufw && sudo ufw enable"
  echo "   Then: sudo ufw allow 22/tcp && sudo ufw allow 5900:5999/tcp"
fi

# 5) Show network info
echo "==> Network addresses (for connecting from your laptop):"
hostname -I || true
echo "Hostname: $(hostname)"

echo "==> Done. Rebooting in 5 seconds so services start cleanly…"
sleep 5
sudo reboot
