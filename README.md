This is my vimrc
==================================
        For backups - - !
Install and Setup 
----------------------------------
###1.Install   vim 
download vim from Internet

###2.Install git

[git for windows](https://code.google.com/p/msysgit/downloads/list)

git for linux <br /> 
In ubuntu: sudo apt-get install git 

###3.Install vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

###4.Install myvimrc

    git clone https://github.com/wanminlee/myvimrc.git  vimrc

###5.Change vimrc

$mv ~/.vimrc ~/oldvim

$mv vimrc/vimrc ~/.vimrc

###6.BundleInstall 

In vim 

:BundleInstall


###7.Delete ^M

:e ++ff=dos  (vim>7.2)

KeyMaps
------------------------------

F5 : single compile <br />
F6 : gdb    (-g -o)<br />
F7 : single compile run<br />
F8 : NERDTree and Tagbar<br />

:map  (for all keymaps)

