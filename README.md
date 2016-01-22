Vimrc :)

Install and Setup
----------------------------------
###1.Install VIM
[Download Vim][0]<br />
Make sure include python+ feature

###2.Install Git

[Github for windows][1]<br />
[Git Download][2]<br />
Remember Add `environment variable` to PATH

###3.Download vundle and vimrc

Use `git` to download repositories :
```sh
git clone https://github.com/VundleVim/Vundle.vim  ~/.vim/bundle/vundle
git clone https://github.com/Suwmlee/vimrc.git  ~/.vim/vimrc
```
Vimrc : [Install ctags][3]

###4.Repalce vimrc file and PluginInstall

Repalce vimrc & add plugin.vim
```sh
cp ~/.vim/vimrc/_vimrc  ~/.vimrc
cp ~/.vim/vimrc/plugin.vim  ~/
```
Start vim and type:
```vim
:VundleInstall
```
Default vimrc include Youcompleteme. You must compile it before using.
If you want to compile it , see more information [Compile YouCompleteMe](#compileycm).
You can also use another plugin `neocomplete.vim`. just set
```vim
let useYoucompleteme = 0
```
in `plugin.vim` which you just added.

<a name="compileycm"></a>

##Compile YouCompleteMe

Go to [YouCompleteMe][4] and compile it by its installation steps

__Windows Installation__

if you are a windows user, here are some tips:

1. Vim must have python+ feature. Type `:py print"hi" `in vim to check whether
python+ feature was enable or not. If it was not enable, careful reading this
page [vimdoc-py][5]. Download a features available version of VIM and use the
specified python version which compiled the VIM.
2. The name of the DLL must match the Python version Vim was compiled with.
Currently the name is `python27.dll`. That is for python27. But not all 2.7.x
series may work, had better konw the `X` number.
3. Make sure the `Microsoft Visual C++(MSVC)` version is right. Find more info
in the 4th part of [full-installation-guide][6]. Find the default version which
are used in `YouCompleteMe\third_party\ycmd\build.py`. Just search for
`Studio Version`. Change to your version is valid.

##Tips

HotKeys:

`F2`  : Show/hide menu & toolbar<br />
`F6`  : Single compile<br />
`F7`  : Tagbar<br />
`F8`  : NerdTree<br />
`F11`  : Fullwindow<br />

`C-a` : Ctrlspace<br />
`C-p` : Ctrlp<br />
`C-e` : End<br />
`\-w` : Move to word<br />
`map` : Show all keymaps

[0]: http://www.vim.org/download.php
[1]: https://windows.github.com/
[2]: http://git-scm.com/downloads
[3]: http://ctags.sourceforge.net/
[4]: https://github.com/Valloric/YouCompleteMe
[5]: http://vimdoc.sourceforge.net/htmldoc/if_pyth.html#python-dynamic
[6]: https://github.com/Valloric/YouCompleteMe#full-installation-guide
