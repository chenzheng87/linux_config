set nocompatible "不兼容模式
syntax enable "语法高亮
"colorscheme evening "设置配色方案
set number "显示行号
set cursorline "突出显示当前行
set ruler "打开状态栏标尺
set shiftwidth=4 "设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 "退格键一次删除4个空格
set tabstop=4 "tab宽度设置为4
set nobackup "覆盖时不保存副本
set autochdir "自动切换当前目录为当前文件所在的目录
set guifont=monaco\ 14
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 delete 键删除回车符
"set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%f[%1*%m%*%n%r%h]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%l%)\ 
"设置在状态行显示的信息
set foldenable "开始折叠
set foldmethod=syntax "设置语法折叠
set foldcolumn=0 "设置折叠区域的宽度
setlocal foldlevel=1 "设置折叠层数为
"set guioptions-=t " 隐藏工具栏
"set guioptions-=m " 隐藏菜单栏
"set foldclose=all "设置为自动关闭折叠 
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr> " 用空格键来开关折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""
let ctags_file_path=findfile("tags",".;")
if !empty(ctags_file_path)
	exe "set tags=".ctags_file_path
endif
map <c-f12> :!ctags -r --c++-kinds=+p --fields=+ias --extra=+q .<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	else
		let cscope_file=findfile("cscope.out",".;")  
		let cscope_pre=matchstr(cscope_file,".*/")  
		if !empty(cscope_file) && filereadable(cscope_file)  
			exe "cs add" cscope_file cscope_pre  
		endif 
	endif
	set csverb
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'ack.vim'
Bundle 'taglist.vim'
Bundle 'Command-T'
Bundle 'https://github.com/lokaltog/vim-powerline.git'
Bundle 'molokai'
Bundle 'YouCompleteMe'

let g:powline_symbols='fancy'
call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8
"""""""""""""""""""""""""""""""""""""""""""""""""""
"set color scheme after vim-powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme molokai "设置配色方案
let g:molokai_original = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tl :Tlist<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth=25
let Tlist_File_Fold_Auto_Close = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
"""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:loaded_youcompleteme=1
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf='/home/chenzheng/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""
" GVIM 
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set guioptions+=c        " 使用字符提示框
	set guioptions-=m        " 隐藏菜单栏
	set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
	set guioptions-=r        " 隐藏右侧滚动条
	set guioptions-=b        " 隐藏底部滚动条
	set showtabline=0		 " 隐藏Tab栏
	set cursorline           " 突出显示当前行
endif
