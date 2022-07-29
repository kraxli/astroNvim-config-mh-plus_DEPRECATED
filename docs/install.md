
```zsh
cd ~/.config/nvim
# git co -b merge_astroNvim
git remote add AstroNvim https://github.com/AstroNvim/AstroNvim
git fetch AstroNvim --tags
git merge --allow-unrelated-histories AstroNvim/main
``` 

```zsh
git clone https://github.com/kraxli/astroNvim-config-mh-plus.git ~/.config/nvim/lua/user/
```

```zsh
cd ~/.config/nvim/lua/user
git co -b merge_user_mehalter
git remote add user_mehalter https://code.mehalter.com/projects/68/files
git fetch user_mehalter --tags
git merge --allow-unrelated-histories user_mehalter
```

```zsh
cd ~/.config/nvim
git submodule add  https://github.com/kraxli/local-nvim.git lua/local
```

see also how to [add local directory](https://github.com/kraxli/home_dave)
