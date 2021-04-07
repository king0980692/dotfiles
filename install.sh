sudo apt-get update

sudo apt-get -y install neovim

sudo apt-get -y install zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone --bare https://github.com/king0980692/dotfiles.git $HOME/.dotfiles
