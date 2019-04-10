set nocompatible				"關閉vim的vi相容模式,以免許多功能不能使用. 這要放第一行
set number 					"顯示行號, 取消用 set nonumber
"set relativenumber				"顯示相對行號
set t_Co=256					"t_Co: terminal color
if &t_Co > 2 || has("gui_running")
	syntax on 				"開啟語法上色
	set hlsearch 				"在蒐尋字串時，字串會變高亮底色。 == set hls
endif
set incsearch					"incremental search, 按下 / 後, 邊打字邊找
set cursorline					"游標的那一列用長長的底線標示出來
"set cursorcolumn				"游標的那一行
set ignorecase					"找字串時忽略大小寫. == set ic

set laststatus=2				"顯示狀態列

set scrolloff=5					"游標移到最下面五行時, 即開始捲動畫面
set scrolljump=5				"一次捲動 5 行. 節約頻寬

set tabstop=8					"tab 設定為 8 個空白那麼大
"set expandtab					"接下來的 tab 用空白取代. 用 retab 可把所有 tab 都轉空白

set autoindent					"自動縮排. == set ai
"set paste					"autoindent 後, 先 paste 再貼上剪貼簿的內容, 才不會亂掉
set showcmd					"在右下角顯示未完成的指令
set ruler					" show the cursor position all the time
set history=50					" keep 50 lines of command line history
set backspace=indent,eol,start			"讓倒退鍵可用來消除縮排, 退到上一行等等...
if has("vms")
	set nobackup				" do not keep a backup file, use versions instead
else
	set backup				"備份原始檔
endif

if has("multi_byte")
	"set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
	"set encoding=utf-8
else
	echoerr "If +multi_byte is not included, you should compile Vim with big features."
endif

"啟動 pathogen 外掛, 以管理在 bundle 目錄下的所有外掛

"powerline plugin{
set guifont=PowerlineSymbols\ for\ Powerline
let g:Powerline_symbols = 'fancy'
"}

function! ToggleMouse()
	if has('mouse')
		" check if mouse is enabled
		if &mouse == 'a'
			" disable mouse
			set mouse=
			echo "Mouse is disabled."
		else
			" enable mouse everywhere
			set mouse=a
			echo "Mouse is enabled."
		endif
	endif
endfunc
"設定滑鼠
"set mouse=nv					"只在 Normal 以及 Visual 模式使用滑鼠，也就是取消 Insert 模式的滑鼠
set mouse=					"用滑鼠選字後，再按終端機快速鍵複製文字
"set mouse=a					"用滑鼠選字後，按y複製，再移到要貼上的地方按p貼上。

"色彩
colorscheme darkblue
let s:current_color_idx = 0
let s:color_list = []
call add(s:color_list, 'blue')
call add(s:color_list, 'darkblue') 
call add(s:color_list, 'default')
call add(s:color_list, 'delek')
call add(s:color_list, 'desert')
call add(s:color_list, 'elflord')
call add(s:color_list, 'evening')
call add(s:color_list, 'industry')
call add(s:color_list, 'jellybeans')
call add(s:color_list, 'jellygrass')
call add(s:color_list, 'koehler')
call add(s:color_list, 'morning')
call add(s:color_list, 'murphy') 
call add(s:color_list, 'pablo')
call add(s:color_list, 'peachpuff')
call add(s:color_list, 'ron')
call add(s:color_list, 'shine')
call add(s:color_list, 'slate')
call add(s:color_list, 'syncolor')
call add(s:color_list, 'torte')
call add(s:color_list, 'vividchalk')
call add(s:color_list, 'zellner')
function! NextColor()
	execute "colorscheme " . s:color_list[s:current_color_idx]
"	echo s:color_list s:color_list[s:current_color_idx] s:current_color_idx len(s:color_list)
	let s:current_color_idx += 1
	if s:current_color_idx >= len(s:color_list)
		let s:current_color_idx = 0
	endif
endfunc

"http://vim.wikia.com/wiki/Highlight_current_line
"hi CursorLine cterm=NONE ctermbg=darkblue guibg=darkred guifg=white

"--- ctags --- 用 ctrl-] 跳到標籤，再用ctrl-t跳回原處 
"首先在src 目錄下產生一個 tags 的檔案.在此自訂一個指令叫做是 'MakeTags'自訂指令第一個字母要大寫。
"以後有更新檔案，標籤跑掉，就重下這個自訂指令更新之.
command! MakeTags !ctags -R .
"再來把會同時使用的專案的tags 檔也加入，搜尋標籤的時候就可以方便的跳過去參考。
set tags=./tags,tags; 				"ctags的tag檔搜尋目錄, 
"接著就看 .vimrc_custom 裡的 tags 還有哪些檔案也要加入的

function! UpdateCtags()
	execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
	execute "TlistUpdate"
endfunc

"Tab notes {
"望文生義常用指令：tabnew, tabclose, tabmove N, tabonly
"gt / gT 跳到下一個或上一個 Tab; 
"不常用, 不做快速鍵
"}

"設定一些快速鍵對映
nmap <F6> :call ToggleMouse()<CR>

"更新ctags
nmap <silent> <F7> :call UpdateCtags()<CR> <CR>

nnoremap <F5> :call NextColor()<CR>


"一次開啟3個Trace Code 神器: Tag List, Source Explorer 和 NerdTree
map <F8> :TrinityToggleAll<CR>

" srcexpl.vim Source Explorer 的獨立開關
map <F9> :TrinityToggleSourceExplorer<CR>

" taglist.vim 的獨立開關
map <F10> :TrinityToggleTagList<CR>

" NERD_tree.vim 的獨立開關
map <F11> :TrinityToggleNERDTree<CR>""""

"快速鍵的小抄
map <F12> :echo "F5:換色 F6:滑鼠 F7:更新tags  F8:Trinity.  F9:SrcExpl. F10:TagList F11:NerdTree" <CR>

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

"Source Explorer 的建議設置, see srcexpl.vim
let g:SrcExpl_winHeight = 4
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = [
	\ "__Tag_List__",
	\ "_NERD_tree_"
	\ ]
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"let g:SrcExpl_updateTagsKey = "<F12>"
"let g:SrcExpl_prevDefKey = "<F3>"
"let g:SrcExpl_nextDefKey = "<F4>"

" 修正 Trinity 開啟時的問題: https://github.com/scrooloose/nerdtree/issues/643
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"GitGutter Settings{
"see https://github.com/airblade/vim-gitgutter
"let g:gitgutter_max_signs = 500
"GitGutterEnable
"GitGutterSignsEnable
"GitGutterLineHighlightsDisable
"set updatetime=400
"}

" Cscope 相關的指令小抄{
" find ./ -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files
" cscope -Rbq -i cscope.files

" cscope 會尋找 "cscope.out" 這個檔案, 就讓它從當前目錄下找:
if $CSCOPE_DB == ""
	cscope add ./
endif
"}

" 顯示 CR LF 換行符號 :e ++ff=unix:e ++ff=unix

source ~/.vim/cscope_quickfix.vim
source ~/.vimrc_custom

