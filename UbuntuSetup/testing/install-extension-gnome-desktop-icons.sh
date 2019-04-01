#!/bin/bash

# currentShell=$(readlink /proc/$$/exe);
# if [ "$currentShell" != "/bin/bash" ]
# then
#         echo 'The script is ran by different shell, not Bash shell, be cautious next time.';
#         echo 'I will rerun this script with Bash shell for You, to avoid unusual behaviour';
#         exec bash "$0" "$@";
# fi

# declare PasswordCache=$(( -n true) 2>&1);
# if [ "$PasswordCache" = ": a password is required" ];
# then
#         echo ""
#         echo 'This script is required to be ran as root user.';
#         echo 'You will be asked for a password';
        #else echo 'You have a cached password in place, no need for password.'
# fi

# if [ "$EUID" -ne 0 ];
# then
#         exec  bash "$0" "$@";
#         echo "exec failed" >&2
#         exit 1;
# fi






# Functions and commands used in this script
function download() {
  command wget --quiet --show-progress --timestamping "$1" "$2"
}

function extract() {
  command tar --verbose --extract --gzip --overwrite "$1"
}

function delete() {
  command rm --recursive --force "$1"
}

function rename() {
  command mv -T --no-clobber "$1" "$2"
}

function move() {
  command mv --no-clobber "$1" "$2"
}

function createDirectory() {
  command mkdir --parents "$1"
}

function enableExtension() {
  command gnome-shell-extension-tool --enable-extension=$1
}

function listExtensions() {
  command gsettings get org.gnome.shell enabled-extensions
}

function disableUbuntuIcons(){
  gsettings set org.gnome.desktop.background show-desktop-icons false
}

function replaceGnomeShell() {
  command gnome-shell --replace
}




# Executing the Commands

# TODO: Check if Internet Connection is available

### Downloading and Extracting
delete "./desktop-icons-master.tar.gz";
delete "./desktop-icons-master/";

download "https://gitlab.gnome.org/World/ShellExtensions/desktop-icons/-/archive/fix_drag_n_drop/desktop-icons-fix_drag_n_drop.tar.gz";
rename "desktop-icons-fix_drag_n_drop.tar.gz" "desktop-icons-master.tar.gz"
extract --file="desktop-icons-master.tar.gz"
delete "./desktop-icons-master.tar.gz";

rename "desktop-icons-fix_drag_n_drop/" "desktop-icons-master/"
sleep 15

### Building and Installing
delete "$HOME/.local/share/gnome-shell/extensions/desktop-icons@csoriano/";

cd "./desktop-icons-master/"
PREFIX="$HOME/.local/share/gnome-shell/extensions/desktop-icons@csoriano/"
BUILD_DIR="latest_gnome_desktop_icons_build"

meson --prefix="${PREFIX}" "${BUILD_DIR}"
ninja -C "${BUILD_DIR}" install

delete "../desktop-icons-master/"

### Enabling The Extension and Removing old implementations
disableUbuntuIcons;
enableExtension "desktop-icons@csoriano";
#replaceGnomeShell;




### Unused code Examples
#rename "./desktop-icons-master/" "./desktop-icons@csoriano/"
#move "./desktop-icons@csoriano/" "$HOME/.local/share/gnome-shell/extensions/";
#createDirectory "$HOME/.local/share/gnome-shell/extensions/desktop-icons@csoriano/"
