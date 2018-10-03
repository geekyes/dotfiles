# coding=utf-8

import os

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
    cfg()
