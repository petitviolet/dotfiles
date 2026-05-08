# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for managing development environment configurations across Mac and Linux (CentOS) systems. The repository uses a symlink-based approach where files prefixed with `_` are linked to the home directory with a `.` prefix.

## Common Commands

### Initial Setup
```bash
# Clone and install dotfiles
git clone https://github.com/petitviolet/dotfiles.git
cd dotfiles
sh install.sh  # Creates symlinks in $HOME, prompts before overwriting existing files

# For Mac setup with Homebrew
brew bundle  # Installs all packages from Brewfile

# For Ansible-based setup (Mac)
cd ansible
ansible-playbook -i inventory macbook.yml
```

### Vim Plugin Management
```vim
# In Vim, install plugins
:BundleInstall
:NeoBundleInstall
# Check for errors
:messages
```

## Architecture & Structure

### File Organization
- **Configuration files**: Prefixed with `_` (e.g., `_zshrc`, `_vimrc`)
- **Installation**: `install.sh` creates symlinks from `_filename` to `~/.filename`
- **Platform-specific scripts**: Separate setup scripts for Mac (`ricty.sh`) and CentOS (`yum.sh`, `vim.sh`)

### Key Components
1. **Shell Environment**: 
   - `_zshrc` - Main Zsh configuration
   - `_zshrc.alias` - Shell aliases
   - Local overrides: `.zshrc.local`, `.vimrc.local` (not tracked in git)

2. **Editor Configurations**:
   - Vim: `_vimrc`, `_vimrc_plugins`, `_vim/` directory
   - Neovim: `nvim/init.vim`, `nvim/plugins.vim`
   - VSCode: `Preferences/VSCode/settings.json`

3. **Development Tools**:
   - Git: `_gitconfig`
   - tmux: `_tmux.conf` (Note: `reattach-to-user-namespace` line is Mac-specific)
   - Package management: `Brewfile` for Mac, `yum.sh` for CentOS

4. **Automation**:
   - Ansible playbook at `ansible/macbook.yml` with roles for homebrew, dotfiles, ricty font, and settings

### Important Notes
- The repository supports both Mac and Linux environments
- Local configuration files (`.zshrc.local`, `.vimrc.local`) are used for machine-specific or sensitive settings
- The `install.sh` script moves existing dotfiles to `~/.Trash/` before creating symlinks