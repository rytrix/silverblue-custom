# UBlue Image Template

# Purpose

This repository is meant to be a template for building your own custom Universal Blue image. This template is the recommended way to make customizations to any image published by the Universal Blue Project:
- [Aurora](https://getaurora.dev/)
- [Bazzite](https://bazzite.gg/)
- [Bluefin](https://projectbluefin.io/)
- [uCore](https://projectucore.io/)
- [main](https://github.com/ublue-os/main/)
- [hwe](https://github.com/ublue-os/hwe/) 

This template includes a Containerfile and a Github workflow for building the container image. As soon as the workflow is enabled in your repository, it will build the container image and push it to the Github Container Registry.

# How to Use

## To rebase to this image
rpm-ostree rebase ostree-unverified-registry:ghcr.io/rytrix/silverblue-custom:latest

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/rytrix/silverblue-custom:latest
