sudo touch /usr/bin/zram.sh
echo "#!/bin/bash"| sudo tee -a /usr/bin/zram.sh
echo "modprobe zram num_devices=4"| sudo tee -a /usr/bin/zram.sh
echo ""| sudo tee -a /usr/bin/zram.sh
echo "totalmem=`free | grep -e '^Mem:' | awk '{print $2}'`"| sudo tee -a /usr/bin/zram.sh
echo "mem=$(( ($totalmem / 4)* 1024))"| sudo tee -a /usr/bin/zram.sh
echo ""| sudo tee -a /usr/bin/zram.sh
echo "echo $mem > /sys/block/zram0/disksize"| sudo tee -a /usr/bin/zram.sh
echo "echo $mem > /sys/block/zram1/disksize"| sudo tee -a /usr/bin/zram.sh
echo "echo $mem > /sys/block/zram2/disksize"| sudo tee -a /usr/bin/zram.sh
echo "echo $mem > /sys/block/zram3/disksize"| sudo tee -a /usr/bin/zram.sh
echo ""| sudo tee -a /usr/bin/zram.sh
echo "mkswap /dev/zram0"| sudo tee -a /usr/bin/zram.sh
echo "mkswap /dev/zram1"| sudo tee -a /usr/bin/zram.sh
echo "mkswap /dev/zram2"| sudo tee -a /usr/bin/zram.sh
echo "mkswap /dev/zram3"| sudo tee -a /usr/bin/zram.sh
echo ""| sudo tee -a /usr/bin/zram.sh
echo "swapon -p 5 /dev/zram0"| sudo tee -a /usr/bin/zram.sh
echo "swapon -p 5 /dev/zram1"| sudo tee -a /usr/bin/zram.sh
echo "swapon -p 5 /dev/zram2"| sudo tee -a /usr/bin/zram.sh
echo "swapon -p 5 /dev/zram3"| sudo tee -a /usr/bin/zram.sh
sudo chmod +x /usr/bin/zram.sh
sudo sed -i 's/exit 0/\/usr\/bin\/zram.sh \&/g' /etc/rc.local
echo "exit 0"| sudo tee -a /etc/rc.local