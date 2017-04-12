#!/usr/local/bin/python
# coding: UTF-8

import os.path
import logging
import glob

home = os.environ['HOME']
entityDir = os.path.join(home, '.dotfiles/src')
listDir = os.listdir(entityDir)
