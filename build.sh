#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree install \
    gnome-themes-extra \
    btop htop \
    kitty alacritty tilix \
    neovim zsh git tldr zoxide \
    fastfetch \
    powertop \
    virt-manager \
    brightnessctl gammastep mako polkit-gnome pulseaudio-utils slurp sway waybar wofi

sudo systemctl enable libvirtd
