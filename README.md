# dotfiles

## Install

    make install

### Nvim Setup

Nvim uses [vim-plug](https://github.com/junegunn/vim-plug) for plugin management.

**Install plugins:**

    nvim +PlugInstall +qa

**Update plugins:**

    nvim +PlugUpdate +qa

### Tmux Plugins

After running `make install`, install tmux plugin manager (TPM):

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Then open tmux and press `prefix + I` (capital i) to install plugins.

## Development

    make build
    make run
