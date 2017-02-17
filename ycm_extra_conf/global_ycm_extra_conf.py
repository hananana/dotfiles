# https://github.com/vheon/dotvim/blob/5321347027c21e4c22dc6fcea4cc315052ed25f1/ycm.py
# https://github.com/vheon/dotvim/blob/eeca7006c9e78a70579dc57b7c8ba4ea3f5ee0ef/vimrc

import os

def FlagsForFile(filename, **kwargs):

  flags = [
    '-Wall',
    '-Wextra',
    '-Werror'
    '-pedantic',
    '-I',
    '.',
    '-isystem',
    '/usr/include',
    '-isystem',
    '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
    '-isystem',
    '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include',
    '-isystem',
    '/usr/local/include',
    '-isystem',
    '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1',
  ]

  data = kwargs['client_data']
  filetype = data['&filetype']

  print "debug start"

  dir = data['expand(expand("<sfile>:p:h"))']
  candidates = []
  for root, dirs, files in os.walk(dir):
    for file in files:
      path, ext = os.path.splitext(file)
      if ext == ".mm":
        candidates.append(root)
      if ext == ".m":
        candidates.append(root)
      if ext == ".cpp":
        candidates.append(root)
  uniq_flags = list(set(candidates))

  for f in uniq_flags:
    flags += ['-I']
    flags += [f]

  print "debug end"

  if filetype == 'c':
    flags += ['-xc']
  elif filetype == 'cpp':
    flags += ['-xc++']
    flags += ['-std=c++11']
  elif filetype == 'objc':
    flags += ['-ObjC']
    flags += ['-isysroot']
    flags += ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk']
    flags += ['-I']
    flags += ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include']
    flags += ['-F']
    flags += ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks']
    flags += ['-fblocks']
  elif filetype =='objcpp':
    flags += ['-ObjC++']
    flags += ['-isysroot']
    flags += ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk']
    flags += ['-I']
    flags += ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include']
    flags += ['-F']
    flags += ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks']
    flags += ['-fblocks']
  else:
    flags = []

  return {
    'flags':    flags,
    'do_cache': True
  }
