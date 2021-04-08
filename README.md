# TODO LIST
- [ ] tmux and some setting
- [ ] sharing the method to manage neovim plugin by vim script
- [ ] setting up the ALE plugin, the linter/fixer for python
- [X] ~~Start coding ...


# Leon's dotfiles 

###### ref: https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
I refer this article to manage my whole dotfils, which including .zshrc, .vimrc and some neovim config file 
![image](https://user-images.githubusercontent.com/21136873/113861782-28511800-97da-11eb-93be-f9fc09958c13.png)
(my personal start up page of vim using Startify)

Hope to keep clean to manage it.

Good Luck !!!

---

## Update this dotfiles
1. ```git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles```
2. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
3. ```cd ~ ``` (the root directory) 
4. ```dotfiles add <your_update_files>```
5. ```dotfiles commim -m <what you done>```
6. ```dotfiles push ```


---
## Deploy to new enviroment 
Just copy install.sh or download to your new machine, like azure or ecs, and ```sh install.sh```.<br>


