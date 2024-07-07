#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree override remove toolbox --install distrobox

rpm-ostree install \
    gnome-themes-extra gnome-tweaks \
    btop htop \
    kitty alacritty tilix \
    neovim zsh git fzf tldr tmux zoxide \
    fastfetch neofetch \
    virt-manager

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

# systemctl enable podman.socket
