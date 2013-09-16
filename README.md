A vimrc file

Install and Setup 
----------------------------------
###1.Install   vim 
Download vim from Internet

###2.Install git

[Git for windows](https://code.google.com/p/msysgit/downloads/list)

In ubuntu: `sudo apt-get install git`

###3.Install vundle and vimrc

Vundle:   `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`<br />
Vimrc :   `git clone https://github.com/wanminlee/vimrc.git  ~/.vim/`<br />
[Install ctags](http://ctags.sourceforge.net/)

###4.Change your vimrc file

In Linux: <br />
`$mv ~/.vimrc ~/oldvim`<br />
`$mv ~/.vim/vimrc/_vimrc  ~/.vimrc`

###5.BundleInstall 

In vim  `:BundleInstall`

##Tips

Delete ^M :   `e ++ff=dos`  (vim>7.2)

Keys:

`F5`  : single compile <br />
`F6`  : gdb    (-g -o)<br />
`F7`  : single compile run<br />
`F8`  : NERDTree and Tagbar<br />
`map` : (for all keymaps)

