# Leon's dotfiles 

###### ref: https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
I refer this article to manage my whole dotfils, which including .zshrc, .vimrc and some neovim config file 
![image](https://user-images.githubusercontent.com/21136873/113861782-28511800-97da-11eb-93be-f9fc09958c13.png)
(my personal start up page of vim using Startify)

Hope to keep clean to manage it.

Good Luck !!!

--- 
## Usage
1. ```git clone --bare https://github.com/king0980692/dotfiles.git $HOME/.dotfiles```
2. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
3. ```dotfiles checkout```

---
## After entering the new environment
You might be ensure below requirement should be satisfy:
* (change default root passwd):
     1. ```sudo -i```
     2. ```passwd```
* ```sudo apt-get update```
* ```sudo apt-get -y install neovim```
* ```sudo apt-get -y  install zsh```
* ```sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"```
* ```chsh -s /bin/zsh ```
      * (If you using SSH, you need to modify[need sudo] "/etc/passwd" ,which be like: username@address :bin/zsh )
* [vim-plug] 
     * ```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' ```
      
* (enter vim/neovim) typing ```:PluginInstall```


