#!/usr/local/bin/python
# coding: UTF-8

import os.path
import shutil

home = os.environ['HOME']
entityDir = os.path.join(home, '.dotfiles/src')
listDir = os.listdir(entityDir)
listDir.remove('.DS_Store')

for path in listDir:
    dotPath = '.' + path
    linkPath = os.path.join(home, dotPath)
    print(linkPath)
    entityPath = os.path.join(entityDir, path)
    print(entityPath)
    if os.path.exists(linkPath):
        if os.path.isdir(linkPath):
            if os.path.islink(linkPath):
                os.unlink(linkPath)
            else:
                shutil.rmtree(linkPath)
        else:
            if os.path.islink(linkPath):
                os.unlink(linkPath)
            else:
                os.remove(linkPath)

    os.symlink(entityPath, linkPath)
