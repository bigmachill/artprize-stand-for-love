from escpos.printer import Network

PRINTER_IP = "192.168.1.219"
p = Network(PRINTER_IP, 9100, timeout=5)

p.set(align="center", bold=True, double_height=True)
p.text("ArtPrize Test\n")
p.set(align="left", bold=False, double_height=False)
p.text("This is a test from the Raspberry Pi.\n")
p.text("Stand for Love, Sit for Treats!\n\n")
try:
    p.cut()
except Exception:
    pass
print("Printed over network.")
