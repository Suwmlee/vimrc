Installation
----
#### 1.Install VIM
[Install official vim][0]<br />

Windows version:<br />
[micbou-vim][12]  or  [vim-github][13]

#### 2.Install Git
[Github for windows][1] or [Git][2]<br />
__Attention__: add _variable_ to __PATH__

#### 3.Install vundle and vimrc
Use __git__ to download repositories :
```sh
git clone https://github.com/VundleVim/Vundle.vim  ~/.vim/bundle/vundle
git clone https://github.com/Suwmlee/vimrc.git  ~/.vim/vimrc
```
#### 4.Repalce vimrc file and PluginInstall
Repalce _vimrc_ & add _.vimrc.plugins_
```sh
cp ~/.vim/vimrc/_vimrc  ~/.vimrc
cp ~/.vim/vimrc/.vimrc.plugins  ~/
```
Start vim and type:
```vim
:VundleInstall
```
Default vimrc include __Youcompleteme__. You must compile it before using.
If you want to compile it , see more information [Compile YouCompleteMe](#compileycm).
You can also use another plugin __neocomplete.vim__. just set
```vim
let useNeocomplete = 1
let useYoucompleteme = 0
```
in _.vimrc.plugins_ which you just added in `~/`.

__Attention__: only one autocomplete plugin is available

Third part extentions needed setup
----
| plugin            | extentions               |
| -                 | ----                     |
| [tagbar][11]      | [Ctags][3]               |
| [vim-devicons][9] | [Nerd-fonts][8]          |
| [ag.vim][10]      | [The_silver_searcher][7] |
__Attention__:
* The default font you can find in _Fonts_ folder
* Windows version placed in _WindowsExt_ folder

<a name="compileycm"></a>
## Compile YouCompleteMe

Go to [YouCompleteMe][4] and compile it by its installation steps

__Windows Installation__

If you use windows , here are some tips:

1. Vim must have __python+ feature__. Type `:py print"hi" `in vim to check whether
python+ feature was enable or not. If it was not enable, careful reading this
page [vimdoc-py][5]. Download a features available version of VIM and use the
specified python version which compiled the VIM.
2. The name of the DLL must match the Python version Vim was compiled with.
Currently the name is __python27.dll__. That is for python27. But not all __2.7.x__
series may work, had better konw the __x__ number.
3. Make sure the __Microsoft Visual C++(MSVC)__ version is right. Find more info
in the 4th part of [full-installation-guide][6]. Find the default version which
are used in `YouCompleteMe\third_party\ycmd\build.py`. Just search for
_Studio Version_. Just change the version in the file is valid .
4. Vim could only dynamic load one python dll.

## Tips

| HotKeys | Function                 |
| --      | ----                     |
| F2      | Show/hide menu & toolbar |
| F7      | Tagbar                   |
| F8      | NerdTree                 |
| F11     | Fullwindow               |
| C-a     | Ctrlspace                |
| C-p     | Ctrlp                    |
| C-e     | End                      |
| \\-w    | Move to word             |
| map     | Show all keymaps         |

[0]: http://www.vim.org/download.php
[1]: https://windows.github.com/
[2]: http://git-scm.com/downloads
[3]: http://ctags.sourceforge.net/
[4]: https://github.com/Valloric/YouCompleteMe
[5]: http://vimdoc.sourceforge.net/htmldoc/if_pyth.html#python-dynamic
[6]: https://github.com/Valloric/YouCompleteMe#full-installation-guide
[7]: https://github.com/ggreer/the_silver_searcher
[8]: https://github.com/ryanoasis/nerd-fonts
[9]: https://github.com/ryanoasis/vim-devicons
[10]: https://github.com/rking/ag.vim
[11]: https://github.com/majutsushi/tagbar
[12]: https://github.com/micbou/vim
[13]: https://github.com/vim/vim-win32-installer
