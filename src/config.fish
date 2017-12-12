
if type -q balias
    balias gst 'git status'
    balias gf 'git fetch --prune'
    balias gfp 'git fetch --prune'
    balias ga 'git add'
    balias gaa 'git add --all'
    balias gb 'git branch'
    balias gba 'git branch -a'
    balias gc 'git commit -v'
    balias gcb 'git checkout -b'
    balias gco 'git checkout'
    balias gd 'git diff'
    balias gl 'git pull --prune'
    balias l 'ls -la'
else
    echo 'install balias. fisher balias'
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

