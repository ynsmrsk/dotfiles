# check uefi is enabled
ls /sys/firmware/efi/efivars

# connect to the internet
wifi-menu

# update the system clock
timedatectl set-ntp true

# partition the disks
lsblk

# fdisk
m `help`
p `show parts`
d `delete`
n `new part`
w `write`
q `quit`
`notice to select last part primary`
`1.boot  2.swap  3.root  4.home`

# format the partitions
mkfs.ext4 /dev/sda1 `boot`
mkswap /dev/sda2 `swap`
swapon /dev/sda2 `swap`
mkfs.ext4 /dev/sda3 `root`
mkfs.ext4 /dev/sda4 `home`

# create dirs will be mounted
mkdir /mnt/boot
mkdir /mnt/home

# mount the file systems
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home

# check that everything is ok
lsblk

# Actual Installation

# configure mirrorlist
vim /etc/pacman.d/mirrorlist
# install the base packages
pacstrap /mnt base base-devel neovim

# generate fstab file (auto mounting)
genfstab -U /mnt >> /mnt/etc/fstab
# check the resulting file
nvim /mnt/etc/fstab

# change root into the new system
arch-chroot /mnt

# set time zone
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
# sync hardware clock
timedatectl set-ntp true
# set hardware clock to generate /etc/adjtime
hwclock --systohc

# uncomment preferred locales
nvim /etc/locale.gen
# generate locale file
locale-gen

# create locale.conf, set the LANG variable
nvim /etc/locale.conf
"LANG=en_US.UTF-8"
# set keyboard layout
nvim /etc/vconsole.conf
"KEYMAP=trq"
# OR use localectl instead
localectl set-locale LANG="en_US.UTF-8"
localectl set-keymap trq

# create hostname file
nvim /etc/hostname
"hostName"
# or
echo hostname > /etc/hostname

nvim /etc/hosts
"127.0.0.1        localhost.`localdomain        localhost`"
"::1              localhost.`localdomain        localhost`"
"127.0.1.1        hostName.localdomain          hostName"

# set the root password
passwd
# add user
useradd -m -g users -G wheel -s /bin/bash userName
# create password for new user
passwd username

# enable sudo commands without password
sudo EDITOR=nvim visudo
# uncomment the following line
"%wheel ALL=(ALL) NOPASSWD: ALL"

# install grub
pacman -S grub os-prober
# install grub on new system
grub-install /dev/sda
# create grub config file
grub-mkconfig -o /boot/grub/grub.cfg

# install necessary packages
pacman -Syyu
dialog
wpa_supplicant
network-manager-applet
pulseaudio
alsa-utils
volumeicon
chromium
curl
feh
gcolor2
intel-ucode
alacritty
kitty
linux-headers
vifm
vlc
xclip
zip
unzip
tar
# vital for .xinitrc
libinput
xorg-server
xorg-xinit
xorg-setxkbmap
hsetroot
unclutter

# clone archlinux repo
git clone https://www.github.com/ynsmrsk/archlinux

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install packages from yay
i3-gaps-rounded-git
gotop-git
compton-tryone-git

# exit the chroot session
exit

# unmount the file system
umount -R /mnt

# reboot | remove usb
reboot

# if wifi-menu fucks up
wifi-menu -o wlp3s0
netctl

# enable network manager
sudo systemctl enable NetworkManager
