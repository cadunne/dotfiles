#!/bin/zsh
# Simple script to update Oh My Zsh and plugins

echo "==> Updating Oh My Zsh"
if [ -d "$HOME/.oh-my-zsh" ]; then
  cd "$HOME/.oh-my-zsh"
  git pull
else
  echo "Oh My Zsh not found. Run install script first."
  exit 1
fi

echo "==> Updating Powerlevel10k theme"
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  git pull
fi

echo "==> Updating zsh-autosuggestions"
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  git pull
fi

echo "==> Updating zsh-syntax-highlighting"
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  git pull
fi

echo "==> All updates complete!" 