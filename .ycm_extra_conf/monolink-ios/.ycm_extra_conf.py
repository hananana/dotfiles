# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

# Cocos2d-x project configuration 
# Please put this file under cocos2d-x project directory

import os
import ycm_core
# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [

'-fmessage-length=0',
'-fobjc-arc',
'-Wno-trigraphs',
'-fpascal-strings',
'-Os',
'-Wno-missing-field-initializers',
'-Wno-missing-prototypes',
'-Wreturn-type',
'-Wno-implicit-atomic-properties',
'-Wno-receiver-is-weak',
'-Wduplicate-method-match',
'-Wformat',
'-Wno-missing-braces',
'-Wparentheses',
'-Wswitch',
'-Wno-unused-function',
'-Wno-unused-label',
'-Wno-unused-parameter',
'-Wunused-variable',
'-Wunused-value',
'-Wempty-body',
'-Wuninitialized',
'-Wno-unknown-pragmas',
'-Wno-shadow',
'-Wno-four-char-constants',
'-Wno-conversion',
'-Wno-constant-conversion',
'-Wno-int-conversion',
'-Wno-enum-conversion',
'-Wno-shorten-64-to-32',
'-Wpointer-sign',
'-Wno-newline-eof',
'-Wno-selector',
'-Wno-strict-selector-match',
'-Wno-undeclared-selector',
'-Wno-deprecated-implementations',
'-isysroot',
'/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.1.sdk',
'-fexceptions',
'-fasm-blocks',
'-fstrict-aliasing',
'-Wprotocol',
'-Wdeprecated-declarations',
'-g',
'-fvisibility=hidden',
'-Wno-sign-conversion',
'-fobjc-abi-version=2',
'-fobjc-legacy-dispatch',
'-mios-simulator-version-min=6.0',
'-iquote',
'-I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.1.sdk/System/Library/Frameworks/Foundation.framework/Headers',
'-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
#'-I/Users/user/another/random/folder/here',
#'-I/Users/user/random/folder/here',
#'-I/Users/random/folder/here',
'-DNS_BLOCK_ASSERTIONS=1',
'-MMD',
'-MT',
'-MF',

'-Wall',
'-Wextra',
'-Wno-long-long',
'-Wno-variadic-macros',
'-Wno-ignored-qualifiers',
# You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
# source code needs it.
'-DUSE_CLANG_COMPLETER',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
#'-x', 'c++',
'-isystem', '../BoostParts',
'-isystem',
# This path will only work on OS X, but extra paths that don't exist are not
# harmful
'/System/Library/Frameworks/Python.framework/Headers',
# System library on Mac
# run `echo | clang -std=c++11 -stdlib=libc++ -v -E -x c++ -` to obtain system lib paths
'-isystem',
'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1',
'-isystem', '/usr/local/include',
'-isystem',
'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.1/include',
'-isystem',
'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
'-isystem',
'/usr/include',
'-isystem',
'/System/Library/Frameworks',
'-isystem',
'/Library/Frameworks',
# Cocos2d-x headers
# run `find cocos2d -name '*.h' -o -name '*.hpp' | xargs -L1 dirname | uniq`
# to obtain all the header paths of cocos2d-x lib
'-I', 'MONOLinkCocos/cocos2d',
'-I', 'MONOLinkCocos/cocos2d/cocos',
'-I', 'MONOLinkCocos/cocos2d/cocos/base',
'-I', 'MONOLinkCocos/cocos2d/cocos/physics',
'-I', 'MONOLinkCocos/cocos2d/cocos/math',
'-I', 'MONOLinkCocos/cocos2d/cocos/2d',
'-I', 'MONOLinkCocos/cocos2d/cocos/ui',
'-I', 'MONOLinkCocos/cocos2d/cocos/network',
'-I', 'MONOLinkCocos/cocos2d/cocos/audio/include',
'-I', 'MONOLinkCocos/cocos2d/cocos/editor-support',
'-I', 'MONOLinkCocos/cocos2d/extensions',
'-I', 'MONOLinkCocos/cocos2d/external',
'-I', 'MONOLinkCocos/cocos2d/external/chipmunk/include/chipmunk',
'-I', 'MONOLinkCocos/cocos2d/external/curl/include/ios',
'-I', 'MONOLinkCocos/cocos2d/cocos/platform/mac',
'-I', 'MONOLinkCocos/cocos2d/cocos/platform/ios',
# Headers of your cocos2d-x project
# run `find Classses -name '*.h' -o -name '*.hpp' | xargs -L1 dirname | uniq`
# to obtain all the paths containing your headers
# 
# need to set every project
'-I', 'MONOLinkCocos/Classes',
'-I', 'MONOLinkCocos/Classes/utils',
'-I', 'MONOLinkCocos/proj.ios_mac/libMONOLinkCocos',
'-I', 'MONOLinkCocos/proj.ios_mac/ios',
'-I', 'MONOLinkMakeCanvas/Cocos2dx Bridge'
# Cocos2d-x macros
'-D', 'USE_FILE32API',
'-D', 'CC_TARGET_OS_MAC',
'-D', 'COCOS2D_DEBUG=1',
'-D', 'CC_ENABLE_CHIPMUNK_INTEGRATION'
]
# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
 
 
# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''
 
if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None
 
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
 
def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )
 
 
def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag
 
    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )
 
    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break
 
      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break
 
    if new_flag:
      new_flags.append( new_flag )
  return new_flags
 
 
def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]
 
 
def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )
 
 
def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None
 
    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )
 
    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    try:
      final_flags.remove( '-stdlib=libc++' )
    except ValueError:
      pass
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )
 
  return {
    'flags': final_flags,
    'do_cache': True
  }
