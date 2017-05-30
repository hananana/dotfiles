#! /bin/bash

dateInt=$(date '+%s')
mod=$(($dateInt % 5))
if [ 0 -eq $mod ]; then
    echo '    旦_(´･ω･`)'
elif [ 1 -eq $mod ]; then
    echo '   ~旦_(´･ω･`)'
elif [ 2 -eq $mod ]; then
    echo '  ~~旦_(´･ω･`)'
elif [ 3 -eq $mod ]; then
    echo ' ~~~旦_(´･ω･`)'
elif [ 4 -eq $mod ]; then
    echo '~~~~旦_(´･ω･`)'
fi
