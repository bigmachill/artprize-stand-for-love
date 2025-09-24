from escpos.printer import Network

# replace with your printer's IP address
p = Network("192.168.1.150")  

p.text("Hello from Raspberry Pi!\n")
p.text("❤️ Stand for Love, Sit for Treats ❤️\n")
p.cut()

