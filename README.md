# Stand for Love, Sit for Treats  
An Interactive ArtPrize 2025 Installation by Mackenzie Hill  

---

## 🎨 Project Overview
*Stand for Love, Sit for Treats* is an interactive sculpture that celebrates community, pets, and play.  

- **Dogs** → When a dog sits in front of the sculpture, the system detects them and dispenses a treat.  
- **Humans** → When a person makes a hand-heart gesture, the system prints an uplifting message on a receipt-style printer.  

The sculpture is built from **welded sheet steel**, **3D-printed components**, and powered by a **Raspberry Pi 4B** with AI vision models and simple robotics.  

This project is featured at **ArtPrize 2025** in collaboration with [Vetr Health](https://www.vetrhealth.com/).  

---

## ⚙️ Hardware
- **Raspberry Pi 4B (4–8GB)**  
- **Arducam Camera** (5MP fisheye for testing; 12MP upgrade planned)  
- **NEMA-17 Stepper Motor** + driver (A4988/DRV8825/TMC)  
- **3D Printed Barrel & Treat Chute**  
- **Epson TM-m30III Thermal Printer (ESC/POS)**  
- **Welded sheet steel dog form** (fabricated with DeWys Manufacturing support)  

---

## 💻 Software
- **Python 3.11 (Raspberry Pi OS 64-bit)**  
- **OpenCV** (camera + DNN for dog detection)  
- **python-escpos** (printer control)  
- **RPi.GPIO / pyserial** (motor control)  
- **Optional**: MediaPipe or Ultralytics YOLO (for advanced hand/gesture detection)  

---

## 📂 Project Structure
artprize-stand-for-love/

├── src/ # Python source (main.py, helpers)

├── tests/ # Test scripts (printer, stepper, camera)

├── models/ # ONNX models for lightweight detection

├── docs/ # Signage, artist statement, project notes

├── hardware/ # Wiring diagrams, fabrication notes

├── requirements.txt

└── README.md


---

## 🚀 Quick Start
**On Raspberry Pi 4B (64-bit OS recommended):**
```bash
# Clone repo
git clone https://github.com/<your-username>/artprize-stand-for-love.git
cd artprize-stand-for-love

# Install apt packages
sudo apt update
sudo apt install -y python3-venv python3-opencv python3-numpy v4l-utils ffmpeg

# Create virtual environment
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Run test scripts
python tests/test_printer.py
python tests/test_stepper.py
python tests/test_camera.py

# Run the main app
python src/main.py
```
## 🧑‍🤝‍🧑 Sponsors & Supporters

This project wouldn’t exist without the help of our partners:

**[Vetr Health]** — Partnering organization, hosting the installation (Sadoc, Rachel, Viola)

**[Beer City Dog Biscuits]** — Supplying sustainable, dog-approved treats

**[DeWys Manufacturing]** — Sheet steel fabrication and material sponsorship

**[Grand Rapids Tech Week]** — Inspiring the AI/tech side of the project

**[Wolverine]** — Printing signage for community engagement

**Friends & Family** — Kevin, Bayley, Syd, Ray, and many more who helped bring it to life

## 📜 License

MIT License (open-source, free to remix, adapt, and share).

## 👩‍🎨 About the Artist

I’m Mackenzie Hill, a Grand Rapids–based artist and engineer passionate about welding, printmaking, and creative technology. My work bridges craft + community + innovation to turn simple interactions into shared joy.
