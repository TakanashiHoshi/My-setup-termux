#!/bin/bash

pkg update -y && pkg upgrade -y
pkg install -y zsh git lsd vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "alias ls=lsd" >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" >> ~/.zshrc
echo "plugins=( \
  zsh-autosuggestions \
  zsh-autocomplete \
  zsh-syntax-highlighting \
  autoupdate \
)" >> ~/.zshrc
echo "export UPDATE_ZSH_DAYS=1" >> ~/.zshrc

source ~/.zshrc

echo "Paket zsh, git, lsd, vim, Oh My Zsh, alias ls=lsd, Powerlevel10k, plugin Zsh, dan konfigurasi pembaruan harian telah berhasil diinstall."
