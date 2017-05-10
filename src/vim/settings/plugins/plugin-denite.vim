
call denite#custom#source('file_rec', 'matchers', ['matcher_regexp'])
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts', ['--nocolor', '--nogroup'])
call denite#custom#var('grep', 'pattern_opt', [])

nmap <silent> <Leader><Leader> :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>b :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>y :<C-u>Denite neoyank -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>a :<C-u>Denite -resume -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>gg :<C-u>Denite grep -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>gc :<C-u>DeniteCursorWord --highlight-mode-insert=Search grep<CR>
nmap <silent> <Leader>o :<C-u>Denite outline -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>n :<C-u>Denite -resume -select=+1 -immediately -highlight-mode-insert=Search<CR>
nmap <silent> <Leader>p :<C-u>Denite -resume -select=-1 -immediately -highlight-mode-insert=Search<CR>
