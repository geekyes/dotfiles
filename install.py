#!/usr/bin/python3

import os

# 安装zsh, vim, tmux
def tool_install():
    tool_install_list = ['zsh', 'vim', 'tmux', 'curl']
    if ('posix' == os.name):
        for i in tool_install_list:
            if (not os.path.exists('/usr/bin/' + i)):
                if (os.system('sudo apt install ' + i)):
                    print (i + ' install failure!!!\n')
                    exit(-1)

def oh_my_zsh_install():
    home_dir = os.environ['HOME']
    if (not os.path.exists(home_dir + '/.oh-my-zsh')):
        print('install oh-my-zsh ...\n')
        if (os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')):
            print('oh-my-zsh install failure!!!\n')
            exit(-1)

def cfg():
    script_dir = os.path.abspath('.')
    home_dir = os.environ['HOME']
    print('cfg ...')
    print('''请手动添加
        source /usr/share/autojump/autojump.sh
        plugins = (git vi-mode wd z)
        到  ~/.zshrc 文件中''')
    os.system('ln -s ' + script_dir + "/vimrc " + home_dir + '/.vimrc')
    os.system('ln -s ' + script_dir + "/tmux.conf " + home_dir + '/.tmux.conf')


if (__name__ == '__main__'):
    tool_install()
    cfg()
    oh_my_zsh_install()
