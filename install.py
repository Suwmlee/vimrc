import os
import os.path
import shutil
import platform

sysflag = platform.system()
user_path = os.path.expanduser('~')
vundle_path = user_path + '/.vim/bundle/vundle'

##下载vundle步骤
def set_vundle():
    success = True
    print("===安装vundle")
    if os.path.exists(vundle_path):
        print('--vundle已安装')
    else:
        try:
            os.system('git clone https://github.com/gmarik/vundle.git  bundle/vundle')
        except:
            success = False
            print("下载vundle出错")
        if success:
            dest = user_path +'/.vim/bundle'
            if os.path.exists(dest):
                print('----原Bundle将重命名为bundle_backup')
                dest_backup = user_path+'/.vim/bundle_backup'
                if os.path.exists(dest_backup):
                    #print('删除bundle_backup')
                    if sysflag == "Windows":
                        delcmd = 'rmdir /s /q '+user_path+'\\.vim\\bundle_backup'
                        os.system(delcmd)
                if sysflag == "Windows":
                    rencmd ='ren '+user_path+'\\.vim\\bundle'+' '+'bundle_backup'
                    os.system(rencmd)
            shutil.copytree('bundle',dest)

## 安装ctags
def set_ctags():
    if sysflag == "Windows":
        ctag_path = user_path +'\\ctags.exe'
        if not os.path.isfile(ctag_path) :
            print("===安装ctags.exe")
            shutil.copyfile('ctags.exe',ctag_path)

## 移动vimrc文件
def move_rc():
    print("===替换vimrc")
    if sysflag == "Windows":
        rcfile = user_path+'/_vimrc'
    elif sysflag =="Linux":
        rcfile = user_path + '/.vimrc'
    if os.path.isfile(rcfile):
        rc_backup = user_path+'/vimrc_back'
        if os.path.isfile(rc_backup):
            os.remove(rc_backup)
        os.rename(rcfile,rc_backup)
    shutil.copyfile('_vimrc',rcfile)

if __name__ == '__main__':
    set_vundle()
    set_ctags()
    move_rc()

