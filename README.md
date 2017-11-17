Installation
----
#### 1.Install VIM
[Install official vim](https://github.com/vim)

#### 2.Install Git
``` sh
# Windows
https://central.github.com/deployments/desktop/desktop/latest/win32

# Ubuntu
sudo apt-get update
sudo apt-get install git-core
```

#### 3.Install plug.vim and vimrc

[Install vim-plug](https://github.com/junegunn/vim-plug#installation)

Install vimrc:
```sh
git clone https://github.com/Suwmlee/vimrc.git  ~/.vim/vimrc
```
#### 4.Repalce vimrc file and PlugInstall
Repalce _vimrc_
```sh
cp ~/.vim/vimrc/.vimrc  ~/.vimrc
```
Start vim and run command:
```vim
:PlugInstall
```
[Compile YouCompleteMe](https://github.com/Valloric/YouCompleteMe#youcompleteme-a-code-completion-engine-for-vim)

__Attention__:
* Put plug.vim in the "autoload" directory.
* Set default browser path for markdown-preview.vim

All Plugins
----
| Plugins                         | Description                               |
| ----                            | ----                                      |
| Valloric/YouCompleteMe          | autocomplete (need compile)               |
| vim-colors-solarized            | GUI colorscheme                           |
| tomasr/molokai                  | Terminal colorscheme                      |
| vim-airline/vim-airline         | status/tabline                            |
| nathanaelkane/vim-indent-guides | display indent levels                     |
| ryanoasis/vim-devicons          | add font icons                            |
| majutsushi/tagbar               | displays tags in a window                 |
| scrooloose/nerdtree             | filesystem window                         |
| vim-ctrlspace/vim-ctrlspace     | show tabs                                 |
| ctrlpvim/ctrlp.vim              | file,buffer,... finder                    |
| rking/ag.vim                    | a code searching tool                     |
| easymotion/vim-easymotion       | fast to get word location                 |
| bronson/vim-trailing-whitespace | show/delete whitespace                    |
| scrooloose/nerdcommenter        | comment in a easy way                     |
| godlygeek/tabular               | text aligning                             |
| iamcco/markdown-preview.vim     | Real-time markdown preview                |
| kana/vim-smartinput             | deal with pairs of punctuations like '()' |
| scrooloose/syntastic            | syntax check                              |
| sheerun/vim-polyglot            | A solid language pack for Vim             |
| derekwyatt/vim-scala            | Scala support                             |
| SirVer/ultisnips                | Snippets                                  |
| honza/vim-snippets              | useful snippets for vim                   |
| tpope/vim-fugitive              | git wrapper for vim                       |

Extra plug-in
----
| plugin                | extra plug-in                |
| ----                  | ----                         |
| [tagbar][ext-1]       | [Ctags][ext-2]               |
| [vim-devicons][ext-3] | [Nerd-fonts][ext-4]          |
| [ag.vim][ext-5]       | [The_silver_searcher][ext-6] |

__Attention__:
* You can find default fonts in _Fonts_ folder
* Windows plugins are placed in _WindowsExt_ folder

## Tips

| HotKeys | Description              |
| ----    | ----                     |
| F2      | Show/hide menu & toolbar |
| F7      | Tagbar                   |
| F8      | NerdTree                 |
| F11     | Show one buffer/window   |
| C-a     | Ctrlspace                |
| A-e     | End                      |
| C-p     | Search Files             |
| Ag      | Search words             |
| \\-y    | Copy to clipboard        |
| \\-p    | Paste from clipboard     |
| \\-w    | Move to word             |
| \\-jd   | GoToDefinition(YCM)      |
| \\-gd   | GoToDeclaration(YCM)     |
| map     | Show all keymaps         |

[ext-1]: https://github.com/majutsushi/tagbar
[ext-2]: http://ctags.sourceforge.net/
[ext-3]: https://github.com/ryanoasis/vim-devicons
[ext-4]: https://github.com/ryanoasis/nerd-fonts
[ext-5]: https://github.com/rking/ag.vim
[ext-6]: https://github.com/ggreer/the_silver_searcher
