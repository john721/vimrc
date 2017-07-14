set number
syntax on
execute pathogen#infect()
set tags=tags;/
set tags=tags;/Users/john/git/dpdk-17.02
map <f7> :Tlist<cr>
" Open and close all the three plugins on the same time
map <F8> :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
map <F9> :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
map <F10> :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
map <F5> :TrinityToggleNERDTree<CR>""""
set mouse=nv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"From the video 'How to Do 90% of What Plugins Do (With Just Vim)'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=** "Find files recursively"
set wildmenu "Display all matching files when we tab complete"
":ls shows the list of opened files.
":b PARTIAL_FILENAME let you go back to the opened file

"Create ctags with command 'MakeTags'
command! MakeTags !ctags -R .

"use :set VARIABLE? to show the current setting of the VARIABLE
"tags, use ^], ctrl-] to jump to tag under cursor
"      use g^], g ctrl-] for ambiguous tags
"      use ^t, ctrl-t to jump back up the tag stack

"Autocomplete. In input mode, ^x enters the X++ mode
"  - ^x^n, for JUST this file
"  - ^x^f, find file names
"  - ^x^], for tags only
"  - ^x^d, macros, definitions
"  - ^n, ^p anything specified by the 'complete' option

