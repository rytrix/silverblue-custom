#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree override remove firefox firefox-langpacks 

rpm-ostree install \
    gnome-themes-extra \
    kitty alacritty \
    neovim zsh git \
    powertop \
    virt-manager \
    clamav rkhunter lynis \
    tuned tuned-utils tuned-profiles-atomic tuned-gtk tuned-switcher \
    brightnessctl gammastep mako polkit-gnome pulseaudio-utils slurp sway waybar wofi NetworkManager-tui 

sudo systemctl enable libvirtd

sudo systemctl mask power-profiles-daemon
sudo systemctl enable tuned
