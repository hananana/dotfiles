# You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
# source code needs it.
# '-DUSE_CLANG_COMPLETER',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
'-stdlib=libc++',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x', 'c++',
# This path will only work on OS X, but extra paths that don't exist are not
# harmful
# run `echo | clang -std=c++11 -stdlib=libc++ -v -E -x c++ -` to obtain system lib paths


# Cocos2d-x headers
# run `find cocos2d -name '*.h' -o -name '*.hpp' | xargs -L1 dirname | uniq`
# to obtain all the header paths of cocos2d-x lib

# Headers of your cocos2d-x project
# run `find Classses -name '*.h' -o -name '*.hpp' | xargs -L1 dirname | uniq`
# to obtain all the paths containing your headers

# Cocos2d-x macros
# '-D', 'USE_FILE32API',
# '-D', 'CC_TARGET_OS_IPHONE',
# '-D', 'COCOS2D_DEBUG=1',
# '-D', 'CC_ENABLE_CHIPMUNK_INTEGRATION'

# DO NOT FORGET PCH
