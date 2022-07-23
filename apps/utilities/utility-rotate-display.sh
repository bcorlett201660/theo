echo ""| sudo tee -a /boot/config.txt
echo "# Rotate Display / Touch"| sudo tee -a /boot/config.txt
echo "lcd_rotate=2"| sudo tee -a /boot/config.txt
sudo reboot
