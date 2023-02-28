#!/bin/sh

backupXinit() {
    if cp ~/.xinitrc ~/.xinitrc-backup -n -v; then
        echo "Created backup of .xinitrc"
    fi
}

cpyXinit() {
    if cp xinitrc ~/.xinitrc -v; then
        echo "Copied new .xinitrc"
    fi
}

backupInitVim() {
    if cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim-backup -n -v; then
        echo "Created backup of init.vim"
    fi
}

cpyInitVim() {
    if cp nvim/init.vim ~/.config/nvim/init.vim -v; then
        echo "Copied new init.vim"
    fi
}

backupOhMyZshThemes() {
    if cp ~/.oh-my-zsh/themes ~/.oh-my-zsh/themes-backup -n -v; then
        echo "Created backup of oh-my-zsh themes"
    fi
}

cpyOhMyZshThemes() {
    if cp zsh/.oh-my-zsh/themes ~/.oh-my-zsh/themes -v -r; then
        echo "Copied new oh-my-zsh themes"
    fi
}

backupZshRc() {
    if cp ~/.zshrc ~/.oh-my-zsh/.zshrc-backup -n -v; then
        echo "Created backup of .zshrc"
    fi
}

cpyZshRc() {
    if cp zsh/.zshrc ~/.zshrc -v; then
        echo "Copied new .zshrc"
    fi
}

install() {
    if ! cmp xinitrc ~/.xinitrc; then
        backupXinit &
        cpyXinit &
    fi

    if ! cmp nvim/init.vim ~/.config/nvim/init.vim; then
        backupInitVim &
        cpyInitVim &
    fi

    if ! diff zsh/.oh-my-zsh/themes ~/.oh-my-zsh/themes -r; then
        backupOhMyZshThemes &
        cpyOhMyZshThemes &
    fi

    if ! cmp zsh/.zshrc ~/.zshrc; then
        backupZshRc &
        cpyZshRc &
    fi

}

install &

