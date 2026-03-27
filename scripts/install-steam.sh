sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt install steam-installer

sudo apt install libgl1-mesa-dri:i386 libgl1:i386
sudo apt-get upgrade steam -f
sudo apt install nvidia-driver-libs:i386
