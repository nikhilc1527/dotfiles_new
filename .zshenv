export PATH=$HOME/.scripts:$HOME/Downloads/node-v15.5.0-linux-x64/bin:$HOME/Downloads/google-cloud-sdk/bin:$HOME/.cabal/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/Downloads/fzf/bin:/mnt/sda2/Nikhil/git_cloned_repos/bat/target/release:~/.local/bin:/usr/sbin:/usr/local/bin:$HOME/MyFiles/Nikhil/git_cloned_repos/cordless:$HOME/.local/bin:/root/.local/bin:/usr/lib/gnupg:$HOME/.local/share/flutter/bin:/usr/bin/vendor_perl:$HOME/.local/src/Extract:$HOME/.config/cargo/bin

export ZDOTDIR="$HOME"/.config/zsh

export JAVA_HOME=/usr

export VISUAL="emacsclient -a \"\" -c"
export EDITOR="$VISUAL"
export SUDO_EDITOR="emacs -q --eval \"(setq inhibit-startup-screen t)\""

export HISTSIZE=100000000000000
export HISTFILESIZE=100000000000000

export CXX="/usr/bin/g++"
export CC="/usr/bin/gcc"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export PAGER="less"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"

# spring cleaning
export CARGO_HOME="~/.config/cargo"
export WORKON_HOME="$XDG_CONFIG_HOME/virtualenvs"
export SSB_HOME="$XDG_DATA_HOME"/zoom
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export LESSHISTFILE=-
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export MBSYNCRC="$XDG_CONFIG_HOME"/mbsyncrc
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch-config
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export ABDUCO_SOCKET_DIR="$XDG_STATE_HOME"/abduco

export GTK_THEME=Adwaita:dark
export GTK_THEME=Adwaita:dark

# android studio stuffs
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_SDK_ROOT=$HOME/MyFiles/AndroidSDK2
export ANDROID_SDK_PATH=$HOME/MyFiles/AndroidSDK2
export ANDROID_HOME=$HOME/MyFiles/AndroidSDK2

# export DISPLAY=:1
# . ~/.config/tty.sh

# ibus stuff
GTK_IM_MODULE=ibus 
QT_IM_MODULE=ibus
XMODIFIERS="@im=ibus"

export DEFAULT_SESSION="dwm"

export IN_API_KEY="0f51f83430eb404d942aa18a2c6b066b"

export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=1

export GDK_SCALE=1
export GDK_DPI_SCALE=1

export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk

export PYENV_ROOT="$XDG_DATA_HOME"/pyenv

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export CARGO_HOME="$HOME/.config/cargo"
