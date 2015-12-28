set nocompatible "不兼容模式
syntax enable "语法高亮
set number "显示行号
set cursorline "突出显示当前行
set ruler "打开状态栏标尺
set shiftwidth=3 "设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=3 "退格键一次删除4个空格
set tabstop=4 "tab宽度设置为4
"补全内容不以分割子窗口形式出现，只显示补全列表
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
set cmdheight=1 " 设定命令行的行数为 1
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
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle 'pathogen.vim'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Command-T'

"搜索插件
Bundle 'ack.vim'
"常用两个插件
Bundle 'cscope.vim'
Bundle 'taglist.vim'
"状态栏美化
Bundle 'lokaltog/vim-powerline'
"括号匹配高亮
Bundle 'kien/rainbow_parentheses.vim'
"快速移动
Bundle 'Lokaltog/vim-easymotion'
"自动括号补全
Bundle 'Raimondi/delimitMate'
"代码对齐
Bundle 'godlygeek/tabular'
"批量注释
Bundle 'scrooloose/nerdcommenter'
"静态代码分析
Bundle 'scrooloose/syntastic'
"目录树导航
Bundle 'scrooloose/nerdtree'
"标签导航
Bundle 'majutsushi/tagbar'
"配色方案
Bundle 'molokai'
Bundle 'Solarized'
"自动补全
Bundle 'YouCompleteMe'
Bundle 'tdcdev/ycm_simple_conf'

let g:powline_symbols='fancy'
call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""
"pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
"""""""""""""""""""""""""""""""""""""""""""""""""""
"ack
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'
"""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8
"""""""""""""""""""""""""""""""""""""""""""""""""""
"color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark
"colorscheme solarized "设置配色方案
"let g:solarized_termtrans=0
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
colorscheme molokai
let g:molokai_original = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerd-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>nt :NERDTree<CR>
let g:NERDTreeWinSize=20
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tb :TagbarToggle<CR> 
let g:tagbar_width=20
let g:tagbar_autofocus=1
"""""""""""""""""""""""""""""""""""""""""""""""""""
"rainbow_parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""
"delimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType python let b:delimitMate_nesting_quotes = ['"']
"""""""""""""""""""""""""""""""""""""""""""""""""""
"tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>bb :Tab /=<CR> "按=号对齐代码
nmap <leader>bn :Tab /=<CR> "自定义对齐
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✗'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
"let g:syntastic_python_checkers=['pyflakes']
""highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tl :Tlist<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth=20
let Tlist_File_Fold_Auto_Close = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:loaded_youcompleteme=1
"set completeopt=longest,menu  "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif	 "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"set completeopt-=preview "补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_min_num_of_chars_for_completion=1 "从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 "禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 "语法关键字补全
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_semantic_triggers={}
let g:ycm_semantic_triggers.c=['->', '.', ' ', '(', '[', '&']
let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='/home/chenzheng/.vim/bTaglistundle/YouCompleteMe/.ycm_extra_conf.py'
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
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
