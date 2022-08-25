#!/bin/sh
. $(dirname "$0")/colors.sh
CURRENT_DIR=$(dirname $(readlink -f $0))

echo $BCyan 1/5 Installing apt packages needed. $Color_Off

install_apt(){
    REQUIRED_PKG=$1
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG | grep "install ok installed")
    echo $BPurple Checking for $REQUIRED_PKG: $PKG_OK $Color_Off
    if [ "" = "$PKG_OK" ]; then
    echo "$REQUIRED_PKG not found. installing $REQUIRED_PKG."
    sudo apt-get --yes install $REQUIRED_PKG
    fi
}

PACKAGES="wget zsh duf tree ncdu"

for package in $PACKAGES; do
    install_apt $package
done

echo $BCyan 2/5 Installing delta deb package. $Color_Off
URL=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
    | grep "browser_download_url.*amd64.deb" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | grep -v musl)
FILENAME=$(basename $URL)
wget -q $URL -O $FILENAME
sudo dpkg -i $FILENAME
rm $FILENAME

echo $BCyan 3/5 Installing git config. $Color_Off
CURDIR=$(readlink -f .)
ln -vsfT $CURDIR/git/.gitconfig ~/.gitconfig

echo $BCyan 4/5 Setting up syntax highlighting with 'less'. $Color_Off
ln -vsfT $CURDIR/.lessfilter ~/.lessfilter
eval "$(SHELL=/bin/sh lesspipe)"

echo $BCyan 5/5 Installing zsh configs. $Color_Off
ln -vsfT $CURDIR/zsh/.zshenv         ~/.zshenv
ln -vsfT $CURDIR/zsh/.zsh_aliases    ~/.zsh_aliases
ln -vsfT $CURDIR/zsh/.zshrc          ~/.zshrc
ln -vsfT $CURDIR/zsh/.zsh_completion ~/.zsh_completion
ln -vsfT $CURDIR/zsh/.p10k.zsh       ~/.p10k.zsh
ln -vsfT $CURDIR/.tldrrc             ~/.tldrrc

echo $BCyan 6/6 Installing MesloLGS fonts. $Color_Off
sudo cp -v $CURDIR/fonts/MesloLGS\ NF\ Regular.ttf      /usr/share/fonts/
sudo cp -v $CURDIR/fonts/MesloLGS\ NF\ Bold.ttf         /usr/share/fonts/
sudo cp -v $CURDIR/fonts/MesloLGS\ NF\ Italic.ttf       /usr/share/fonts/
sudo cp -v $CURDIR/fonts/MesloLGS\ NF\ Bold\ Italic.ttf /usr/share/fonts/
# MUST configure font in Terminal interface
