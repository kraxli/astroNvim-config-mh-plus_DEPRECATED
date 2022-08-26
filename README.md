# AstroNvim User Configuration

My personal user config for AstroVim

## Installation

- Install AstroNvim

```sh
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
```

- Install the user settings

```sh
# Linux:
git clone https://github.com/kraxli/astroNvim-config-mh-plus.git ~/.config/astronvim

# windows:
git clone https://github.com/kraxli/astroNvim-config-mh-plus.git $APPDATA$\Local\astronvim
# Windows Powershell:
git clone https://github.com/kraxli/astroNvim-config-mh-plus.git ~\AppData\Local\astronvim
```

- Initialize AstroVim

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## Further setups and installations from within Nvim

see [Setups in astronivim/github.io](https://astronvim.github.io/#-setup)

## Merge updates of mehalter

```sh

cd ~/.config/astronvim
git remote add mehalter https://code.mehalter.com/AstroNvim_user 

rm ~/.config/astronvim_sandbox -rf
cp ~/.config/astronvim ~/.config/astronvim_sandbox -r
cd ~/.config/astronvim_sandbox

git fetch mehalter --tags
git merge --allow-unrelated-histories mehalter/master

# resolve merge conflicts ~/.config/astronvim_sandbox

mv ~/.config/astronvim ~/.config/astronvim_bu
mv ~/.config/astronvim_sandbox ~/.config/astronvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
