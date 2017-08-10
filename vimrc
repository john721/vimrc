set number 					"顯示行號, 取消用 set nonumber
"set relativenumber				"顯示相對行號
syntax on 					"開啟語法上色
set hlsearch 					"在蒐尋字串時，字串會變高亮底色。
set laststatus=2				"顯示狀態列
set tabstop=8
set cursorline					"游標的那一列用長長的底線標示出來
set ignorecase					"找字串時忽略大小寫

"啟動 pathogen 外掛, 以管理在 bundle 目錄下的所有外掛
execute pathogen#infect()

"powerline plugin{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}


"Tab notes {
"望文生義常用指令：tabnew, tabclose, tabmove N, tabonly
"gt / gT 跳到下一個或上一個 Tab; 
"}

"設定一些快速鍵對映, 用來執行一些plugin
" Open and close all the three plugins on the same time
map <f7> :Tlist<cr>
map <F8> :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
map <F9> :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
map <F10> :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
map <F5> :TrinityToggleNERDTree<CR>""""

"設定滑鼠
"set mouse=nv					"只在 Normal 以及 Visual 模式使用滑鼠，也就是取消 Insert 模式的滑鼠
set mouse=					"用滑鼠選字後，再按終端機快速鍵複製文字
"set mouse=a					"用滑鼠選字後，按y複製，再移到要貼上的地方按p貼上。

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"From the video 'How to Do 90% of What Plugins Do (With Just Vim)'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=** "Find files recursively"
set wildmenu "Display all matching files when we tab complete"
":ls shows the list of opened files.
":b PARTIAL_FILENAME let you go back to the opened file

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

"taglist {
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0
let Tlist_GainFocus_On_ToggleOpen = 1
nnoremap <leader>tl : Tlist<CR>
"}

"--- ctags --- 用 ctrl-] 跳到標籤，再用ctrl-t跳回原處 
"首先在src 目錄下產生一個 tags 的檔案.在此自訂一個指令叫做是 'MakeTags'自訂指令第一個字母要大寫。
"以後有更新檔案，標籤跑掉，就重下這個自訂指令更新之.
command! MakeTags !ctags -R .
"再來把會同時使用的專案的tags 檔也加入，蒐尋籤的時候就可以方便的跳過去參考。
set tags=tags;/ 				"ctags的tag檔蒐尋目錄
set tags+=/Users/john/git/dpdk-17.02

source ~/.vim/cscope_quickfix.vim
source ~/.vimrc_custom

