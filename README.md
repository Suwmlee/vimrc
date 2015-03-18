自用Vim配置文件 :)

Install and Setup 
----------------------------------
###1.Install   vim 
[Download Vim](http://www.vim.org/download.php)

###2.Install Git

[Github for windows](https://windows.github.com/)
[Git Download](http://git-scm.com/downloads)
Attention: Add `environment variable`

###3.Install vundle and vimrc

Vundle:   `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`<br />
Vimrc :   `git clone https://github.com/wanminlee/vimrc.git  ~/.vim/`<br />
[Install ctags](http://ctags.sourceforge.net/)

###4.Change your vimrc file

Linux: <br />
`$mv ~/.vimrc ~/.vimrc_backup`<br />
`$mv ~/.vim/vimrc/_vimrc  ~/.vimrc`

###5.BundleInstall 

Vim  `:BundleInstall`

##Tips

Keys:

`F5`  : single compile <br />
`F6`  : gdb    (-g -o)<br />
`F7`  : single compile run<br />
`F8`  : NERDTree and Tagbar<br />
`map` : (for all keymaps)

