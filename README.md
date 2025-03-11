# Dotfiles

Modern shell setup with Oh My Zsh, Powerlevel10k, and useful plugins for an enhanced terminal experience.

> **⚠️ DISCLAIMER ⚠️**  
> This dotfiles repository was inspired by [ryanquinn3/dotfiles](https://github.com/ryanquinn3/dotfiles/tree/master) and has been reorganized with assistance from Cursor AI. While it should work as expected, it hasn't been thoroughly tested in all environments. Use at your own risk and feel free to report any issues you encounter.

## Features

- **Oh My Zsh**: A delightful, open source framework for Zsh
- **Powerlevel10k Theme**: A fast, informative, and customizable Zsh prompt
- **Useful Plugins**:
  - git: Git integration and aliases
  - brew: Homebrew commands and completions
  - kubectl: Kubernetes CLI integration
  - kube-ps1: Kubernetes prompt integration
  - zsh-autosuggestions: Fish-like command suggestions
  - zsh-syntax-highlighting: Syntax highlighting for the shell
- **Simple Configuration**: Minimalist approach to shell setup
- **GitHub Codespaces Support**: Works seamlessly in GitHub Codespaces

## Installation

Run the install script:

```bash
./install
```

The script will:
1. Install Oh My Zsh (if not already installed)
2. Install Powerlevel10k theme and plugins
3. Symlink configuration files to your home directory
4. Optionally configure macOS settings (screenshots, dock, finder)
5. Optionally install Node.js with NVM

### Post-Installation

For the best experience with Powerlevel10k:

1. Install the recommended fonts from [Powerlevel10k's README](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
2. Run `p10k configure` to customize your prompt

## Updating

To update Oh My Zsh, Powerlevel10k theme, and plugins:

```bash
./update.sh
```

## What's Included

- `.zshrc`: Main Zsh configuration
- `.p10k.zsh`: Powerlevel10k configuration
- `.aliases`: Useful command aliases
- `.functions`: Custom shell functions
- `.local-config`: Local environment settings
- `.codespaces-config`: GitHub Codespaces settings

## VS Code Integration

For the best experience in VS Code, these settings are recommended:

```json
{
    "terminal.integrated.fontFamily": "MesloLGS NF",
    "terminal.integrated.defaultProfile.linux": "zsh"
}
```

## GitHub Codespaces

This dotfiles repository works with GitHub Codespaces. When creating a new Codespace, these dotfiles will be automatically applied if you've configured your GitHub account to use them.

## Customization

- Edit `.zshrc` to change general Zsh settings
- Edit `.p10k.zsh` to customize your prompt (or run `p10k configure`)
- Add custom aliases to `.aliases`
- Add custom functions to `.functions`
