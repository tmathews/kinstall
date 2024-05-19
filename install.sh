#!/usr/bin/env bash

echo "Welcome to Kallos experience installer."
mkdir -p /tmp/kallos-installer
cd /tmp/kallos-installer

echo "Installing git and cloning kallos deps..."
pacman -S --needed git base-devel
git clone https://git.sr.ht/~tomtom/kinstall
git clone https://git.sr.ht/~tomtom/kstart
git clone https://git.sr.ht/~tomtom/krunner
git clone https://git.sr.ht/~tomtom/kplymouth

# Install yay
echo "Installing yay..."
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin
echo "Done."

echo "Installing default environment programs..."
yay -S\
	make \
	pipewire pipewire-{jack,alsa,pulse} wireplumber\
	bluez bluez-utils \
	brightnessctl \
	plymouth \
	wlsunset \
	hyprland hyprpaper hypridle hyprlock hyprcursor \
	slurp grim \
	xorg-xwayland \
	xdg-desktop-portal \
	xdg-desktop-portal-wlr \
	wl-clipboard \
	playerctl \
	noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk\
	openssh \
	foot \
	htop \
	neovim \
	screen \
	rsync \
	zip unzip \
	cups \
	bc \
	firefox
echo "Done."

# After installing bluetooth you need to enable it!
echo "Enabling Bluetooth..."
systemctl enable bluetooth
echo "Done."

# Install Kallos
echo "Installing configs..."
mkdir -p ~/.config/kallos
cp ./kinstall/shortcuts ~/.config/kallos/
cp ./kinstall/bash.profile ~/.profile
cp ./kinstall/anthywl.config ~/.config/anthywl/config
cp -R ./kinstall/hypr ~/.config/
echo "Done."

echo "Installing kstart..."
cd ./kstart
make all
sudo make install
echo "Installing krunner..."
cd ../krunner
make all
sudo make install
echo "Installing plymouth theme..."
cd ../kplymouth
./install.sh
echo "Done."
cd ~
