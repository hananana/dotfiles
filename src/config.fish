
if type -q balias
    balias gst 'git status'
    balias l 'ls -la'
else
    echo 'install balias'
end

function cdz
    builtin cd (z -l | fzy | awk '{ print $2 }')
end

function cdghq
    builtin cd (ghq list -p | fzy)
    ls -la
end

function cd
    builtin cd $argv
    ls -la
end

