echo -ne '\n' | sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update

sudo apt-get -y install neovim

sudo apt-get -y install zsh

yes | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt install -y python3-pip

git clone --bare https://github.com/king0980692/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

rm ~/.zshrc

dotfiles checkout

zsh

vim +'PlugInstall --sync' +qa


                                                                                                                1,1           All
