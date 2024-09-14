#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Slow updates
rpm-ostree override remove firefox firefox-langpacks 

rpm-ostree install \
    gnome-themes-extra \
    kitty alacritty \
    neovim zsh git \
    virt-manager \
    clamav rkhunter lynis \
    powertop tuned tuned-utils tuned-profiles-atomic tuned-gtk tuned-switcher \
    brightnessctl gammastep mako polkit-gnome pulseaudio-utils slurp sway waybar wofi NetworkManager-tui 

systemctl enable libvirtd

# Disable automatic updates (I consider random password prompts to be a security risk)
systemctl enable rpm-ostreed-automatic.timer
systemctl enable flatpak-system-update.timer
systemctl --global enable flatpak-user-update.timer

# Swapping to tuned since it is comparable to tlp and much better than power profiles daemon
systemctl mask power-profiles-daemon
systemctl enable tuned
