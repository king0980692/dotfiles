# neovim install
echo -ne '\n' | sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update

sudo apt-get -y install neovim

# zsh install
sudo apt-get -y install zsh

# on-my-zsh
yes | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# zplug
yes | curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# python3-pip
sudo apt install -y python3-pip

sudo apt-get install autojump


# leon's dotfile
git clone --bare https://github.com/king0980692/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


rm ~/.zshrc

dotfiles checkout .zshrc .vimrc .tmux.conf

alias vim='nvim'


vim +'PlugInstall' +qa

export PATH=$PATH:~/.local/bin

zsh

