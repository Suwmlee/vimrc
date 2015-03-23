import os
import os.path
import shutil
import platform

sysflag = platform.system()
user_path = os.path.expanduser('~')
#vundle_path = user_path + '/.vim/bundle/vundle'
vundle_path = user_path + '/.vimtest'
success = True
##下载vundle步骤
if os.path.exists(vundle_path):
    print('vundle已存在,将跳过下载vundle步骤')
else:
    print('vundle不存在,开始下载')
    try:
        os.system('git clone https://github.com/gmarik/vundle.git  bundle/vundle')
    except:
        success = False
        print("下载vundle出错")
    if success:
        dest = user_path +'/.vim/test'
        if os.path.exists(dest):
            print('Bundle文件夹已存在，将重命名为bundle_backup')
            dest_backup = user_path+'/.vim/bundle_backup'
            if os.path.exists(dest_backup):
                #print('删除bundle_backup')
                if sysflag == "Windows":
                    delcmd = 'rmdir /s /q '+user_path+'\\.vim\\bundle_backup'
                    os.system(delcmd)
            if sysflag == "Windows":
                rencmd ='ren '+user_path+'\\.vim\\test'+' '+'bundle_backup'
                os.system(rencmd)
        shutil.copytree('bundle',dest)

## 移动vimrc文件
if sysflag == "Windows":
    rcfile = user_path+'/_vimrc'
elif sysflag =="Linux":
    rcfile = user_path + '/.vimrc'
if os.path.isfile(rcfile):
    print("vimrc文件已存在，将替换")
    rc_backup = user_path+'/vimrc_back'
    if os.path.isfile(rc_backup):
        os.remove(rc_backup)
    os.rename(rcfile,rc_backup)
shutil.copyfile('_vimrc',rcfile)

