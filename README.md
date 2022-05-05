# TODO LIST
- [ ] tmux and some setting
- [ ] sharing the method to manage neovim plugin by vim script
- [ ] setting up the ALE plugin, the linter/fixer for python
- [X] ~~Start coding ...~~

---

## Update this dotfiles
1. ```git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles```
2. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
3. ```cd ~ ``` (the root directory) 
4. ```dotfiles add <your_update_files>```
5. ```dotfiles commim -m <what you done>```
6. ```dotfiles push -u origin master ```

