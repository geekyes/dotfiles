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

def cfg():
    script_dir = os.path.abspath('.')
    home_dir = os.environ['HOME']
    print('cfg ...')
    print('''
        install oh-my-zsh: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        add plugins = (git vi-mode wd z) to ~/.zshrc''')
    os.system('ln -s ' + script_dir + "/vimrc " + home_dir + '/.vimrc')
    os.system('ln -s ' + script_dir + "/tmux.conf " + home_dir + '/.tmux.conf')


if (__name__ == '__main__'):
    tool_install()
    cfg()
