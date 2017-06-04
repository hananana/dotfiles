#!/usr/local/bin/python
# coding: UTF-8

import os.path
import shutil

home = os.environ['HOME']
entityDir = os.path.join(home, '.dotfiles/src')
listDir = os.listdir(entityDir)

for path in listDir:
    dotPath = '.' + path
    linkPath = os.path.join(home, dotPath)
    entityPath = os.path.join(entityDir, path)

    if os.path.exists(linkPath):
        if os.path.islink(linkPath):
            os.unlink(linkPath)
        elif os.path.isdir:
            shutil.rmtree(linkPath)
        else:
            os.remove(linkPath)

    print(entityPath)
    print(linkPath)
    os.symlink(entityPath, linkPath)
