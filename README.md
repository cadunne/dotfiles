# Dotfiles

Modern shell setup with Oh My Zsh, Powerlevel10k, and useful plugins for an enhanced terminal experience.

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

## Installation

Run the install script:

```bash
./install
```

### Post-Installation

For the best experience with Powerlevel10k:

1. Install the recommended fonts from [Powerlevel10k's README](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
2. Run `p10k configure` to customize your prompt

## What's Included

- `.zshrc`: Main Zsh configuration
- `.p10k.zsh`: Powerlevel10k configuration
- `.aliases`: Useful command aliases
- `.functions`: Custom shell functions
- `.local-config`: Local environment settings
- `.codespaces-config`: GitHub Codespaces settings

## VS Code Integration

For the best experience in VS Code, add these settings:

```json
{
    "terminal.integrated.fontFamily": "MesloLGS NF",
    "terminal.integrated.defaultProfile.linux": "zsh"
}
```

## Customization

- Edit `.zshrc` to change general Zsh settings
- Edit `.p10k.zsh` to customize your prompt (or run `p10k configure`)
- Add custom aliases to `.aliases`
- Add custom functions to `.functions`
