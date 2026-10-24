#!/bin/bash

set -ouex pipefail

### Install packages

# Install Librewolf in the OS image.
dnf5 -y config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo
dnf5 -y install librewolf

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


# install Discord client of choice
dnf5 -y copr enable anudeepd/equibop
dnf5 -y install equibop
dnf5 -y copr disable anudeepd/equibop


#install Bitwarden from copr repo
dnf5 -y copr enable anudeepd/bitwarden
dnf5 -y install bitwarden
dnf5 -y copr disable anudeepd/bitwarden

#install Syncthing
dnf5 -y install syncthing

#install VLC
dnf5 -y install vlc


# Dank Material Shell and all optional dependencies:
# https://danklinux.com/docs/dankmaterialshell/installation
# Use upstream's stable DMS repository rather than Terra's DMS package.
dnf5 -y copr enable avengemedia/dms
dnf5 -y copr enable avengemedia/danklinux
dnf5 -y config-manager setopt terra.enabled=0
dnf5 -y --refresh install \
  quickshell \
  cava \
  dankcalendar \
  dgop \
  dsearch \
  matugen \
  qt6-qtmultimedia
# Niri is installed below from yalter/niri.
# Refresh cached metadata and update DMS even if the base already includes it.
dnf5 -y --refresh install dms
dnf5 -y --refresh upgrade dms
rpm -q dms cava dankcalendar dgop danksearch matugen qt6-qtmultimedia
dnf5 -y copr disable avengemedia/dms
dnf5 -y copr disable avengemedia/danklinux

# Install Noctalia Shell
#dnf5 -y config-manager setopt terra.enabled=1
# dnf5 -y install noctalia-legacy
#dnf5 -y install noctalia
#dnf5 -y install cliphist # For clipboard History
#dnf5 -y config-manager setopt terra.enabled=0

dnf5 -y copr enable daniel-g-carrasco/wayland-scroll-factor
dnf5 -y install wayland-scroll-factor
dnf5 -y copr disable daniel-g-carrasco/wayland-scroll-factor

# Install Cursor
dnf5 -y config-manager setopt terra.enabled=1
dnf5 -y install cursor
dnf5 -y config-manager setopt terra.enabled=0

# Install Vicinae from Copr
dnf5 -y copr enable quadratech188/vicinae
dnf5 -y install vicinae
dnf5 -y copr disable quadratech188/vicinae

# Install Niri from Copr
dnf5 -y copr enable yalter/niri
dnf5 -y install niri
dnf5 -y copr disable yalter/niri

# Install Keyd from Copr
dnf5 -y copr enable alternateved/keyd
dnf5 -y install keyd
dnf5 -y copr disable alternateved/keyd

# Install Niri Dependencies
dnf5 -y install brightnessctl
# dnf5 -y install fuzzel
# dnf5 -y install mako
# dnf5 -y install waybar
# dnf5 -y install swaybg
# dnf5 -y install swayidle



# Global Protect Open Connect for UTD-VPN
dnf5 -y copr enable yuezk/globalprotect-openconnect
dnf5 -y install globalprotect-openconnect
dnf5 -y copr disable yuezk/globalprotect-openconnect

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable keyd
