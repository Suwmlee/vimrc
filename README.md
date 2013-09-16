A vimrc file
==================================

Install and Setup 
----------------------------------
###1.Install   vim 
Download vim from Internet

###2.Install git

[Git for windows](https://code.google.com/p/msysgit/downloads/list)

In ubuntu: `sudo apt-get install git`

###3.Install vundle and vimrc

Vundle:   `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
Vimrc :   `git clone https://github.com/wanminlee/vimrc.git  ~/.vim/`
[Install ctags](http://ctags.sourceforge.net/)

###5.Change your vimrc file

In Linux: <br />
`$mv ~/.vimrc ~/oldvim`
`$mv ~/.vim/vimrc/_vimrc  ~/.vimrc`

###6.BundleInstall 

In vim  `:BundleInstall`

##Tips

Delete ^M :   `e ++ff=dos`  (vim>7.2)

KeyMaps
------------------------------

F5 : single compile <br />
F6 : gdb    (-g -o)<br />
F7 : single compile run<br />
F8 : NERDTree and Tagbar<br />

:map  (for all keymaps)

