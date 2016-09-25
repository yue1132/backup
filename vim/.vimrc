""""""""""""""" 基础配置 """""""""""""""""""
"设置行号
set number
" 设置相对行号 挺好玩的
set relativenumber
" 设置智能缩进
set smartindent
" 设置自动缩进的长度
set shiftwidth=4
" 设置<Tab>键占用的列数
 set tabstop=4
" 使用空格代替tab
 set expandtab            
" 编写代码时，换行自动缩进
set autoindent
" 保持光标距离屏幕顶部和底部有3行的距离
set scrolloff=3
" 将被搜索的字符串进行高亮设置
 set hlsearch
" 设置查找自动提示
set incsearch
" 在当前窗口中，如果单行长度过长
" 则能显示多少就显示多少
" 不用将整行全部显示出来
set display=lastline
" 设置高亮光标所在列
set cursorcolumn
" 设置高亮光标所在行
set cursorline
" 配置状态栏
" 总是显示状态拦
set laststatus=2
" 打开文件默认不折叠代码
set foldlevelstart=99
" 自动匹配括号
set showmatch
" 代码可折叠
set foldmethod=indent
set foldlevel=99
" 设置编码格式
set encoding=utf-8
" 系统剪切板
set clipboard=unnamed
" 解决退格键失效的问题
set backspace=indent,eol,start
set modifiable
" 在显示帮助信息列表的时候，显示状态栏
set wildmenu
" 设置里面命令保存条数
set history=1000

""""""""""""""""""""" 映射方案 """""""""""""""""""" "
" 快速插入时间
map <F8> <c-r>=strftime("%Y-%m-%d %X")<cr>
" 共享NERDTree 
map <leader>n <plug>NERDTreeTabsOpen<CR>

inoremap jk <ESC>
inoremap <CAPS_LOCK> <CTRL>
"让vim把所有的数字都当成十进制，不管他们是不是以0开头的
set nrformats=
"set mapleader 设置启动快速启动.vimrc的方式（,ee）
let mapleader = ","
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

noremap <C-u> <esc>gUiwea
" 括号自动补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
" 换行之后插入#保持只能缩进
inoremap # #
" 快速打开控制台
nnoremap <leader>sh :VimShellTab<CR>
" 将当前行移动到下一行
nnoremap - ddp
" 将当前行移动到上一行
nnoremap _ dd2kp
" 在命令模式下将小写转化为大写
nnoremap <leader>u gUiwe
" 将光标所在单词加上双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" 将光标所在单词加上单引号
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" 将H映射为到行首
nnoremap H <S-^>
" 将L映射为到行尾
nnoremap L $
" 映射选中当前光标所在单词
nnoremap m #N
" 在窗口之间快速移动
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" buffer 的快速切换
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" 代码折叠快捷键
nnoremap <space> za
" 快速保存
nnoremap <leader>w :w<CR>
" 重新映射帮助命令
"cnoremap he vert bo h
" 缩写映射
iabbrev xmlv <?xml version="1.0" encoding="utf-8" ?>

" 事件监听
" 自动保存功能
"autocmd InsertLeave *.py *.md :w
" 自动启动文件浏览目录
" autocmd VimEnter * :NERDTreeTabsOpen ' " "

" 为python文件自动添加文件头
autocmd BufNewFile *.py execute ":call NewPy()"
function! NewPy()
" call setline(1,"#!/usr/bin/env python")
call setline(1,"# -*- encoding: utf-8 -*-")
    " call setline(2,"\"\"\" Copyright(c) 2010,Shanghai MJ
    " Intelligent System Co.Ltd<http://www.shmingjiang.com>,All
    " rights reserved.")
    " call setline(3,"Author       : Created by zhaoxinxing")
    " let date_time = strftime("%Y-%m-%d\ %H:%M:%S")
    " call setline(4,"Date         : ".date_time)
    " call setline(5,"Versions     : 1.0")
    " call setline(6,"\"\"\"")
endfunction
" 记录上次关闭vim光标所在的位置
autocmd BufReadPost *
        \ if line("'\"")>0&&line("'\"")<=line("$") |
        \   exe "normal g'\"" |
        \ endif

" Python 快速插入断点
nnoremap <F2> oimport ipdb; ipdb.set_trace()<ESC>:w<CR>

colorscheme desert
syntax enable
" airline 状态栏配置
" 显示buffer标签
let g:airline#extensions#tabline#enabled=1
"let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1

" 高亮行列的配色方
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" 修改高亮的背景色
highlight SyntasticErrorSign guifg=white guibg=black

"自动补全结束函数
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
" 获得vi启动路径
function! CurDir()
    let curdir = substitute(getcwd(),$HOME,"~","g")
    return curdir
endfunction
" 配置markdown转化html
nnoremap <leader>md :call Header() <CR>
function! Header()
    ":execute ':%!/usr/local/bin/Markdown.pl --html4tags'
    :execute ':%!python /usr/local/lib/python2.7/dist-packages/markdown2.py -x
    tables'
    :execute 'normal! Go'
    r ~/mail/mutt/signature.html
endfunction'





""""""""""""""""""""""插件管理""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'kien/rainbow_parentheses.vim' " 括号增强,彩色
Plugin 'trailing-whitespace'          " 增加尾部空格的显示
Plugin 'commentary.vim'               " 注释多行 """
"
Plugin 'vim-scripts/matchit.zip'
"
Plugin 'tpope/vim-surround'
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
 Plugin 'fugitive.vim'                 " git插件
Plugin 'Gist.vim'                     " gist
Plugin 'airblade/vim-gitgutter'       " git diff
Plugin 'WebAPI.vim'                   " gist依赖插件 """"
 Plugin 'Townk/vim-autoclose'          " 括号补全

"vim-tagbar插件可以帮你快速了解当前文件的结构，并让你可以在各个内容之间快速跳
Bundle 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启

"nerdtree是一个用于浏览文件系统的树形资源管理外挂,它可以让你像使用Windows档案总管一样在VIM中浏览文件系统并且打开文件或目录
"移动：hjkl
"展开：o
"切换窗口：Ctrl + w，多次执行或加方向键hjkl来切换
"其他：在侧边栏输入'?'看，:P
Bundle 'scrooloose/nerdtree'
"let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

"在使用 NERDTree 的过程中有一些不太方便的地方就是打开的各个文件不共享
"NERDTree，所以就需要配合安装一个共享插件 vim-nerdtree-tabs，
"这就让你感觉只是打开了一个 NERDTreekk
"Bundle 'jistr/vim-nerdtree-tabs'
" 关闭NERDTree快捷键
" map <leader>t :NERDTreeToggle<CR>
 " 显示行号
" let NERDTreeShowLineNumbers=1
" let NERDTreeAutoCenter=1
 " 是否显示隐藏文件
" let NERDTreeShowHidden=1
 " 设置宽度
" let NERDTreeWinSize=31
 " 在终端启动vim时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
 " 忽略一下文件的显示
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
 " 显示书签列表
" let NERDTreeShowBookmarks=1

"git 信息直接在 NERDTree 中显示出来， 和 Eclipse一样，修改的文件和增加的文件都给出相应的标注
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"是一个用于浏览文件系统的树形资源管理外挂,它可以让你像使用Windows档案总管一样在VIM中浏览文件系统并且打开文件或目录
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

"ctrp 类似sublime的ctrl+p功能
Plugin 'https://github.com/kien/ctrlp.vim.git'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

"syntastic语法检查插件
Plugin 'https://github.com/scrooloose/syntastic.git'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"自动补全插件
Bundle 'Valloric/YouCompleteMe'

" 自动补全配置
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefintionElseDeclaration<CR>
set completeopt-=preview



"vim-airline是一款状态栏增强插件，可以让你的Vim状态栏非常的美观，同时包括了buffer显示条扩展smart tab line以及集成了一些插件
Bundle 'bling/vim-airline'
set laststatus=2

Bundle 'vim-scripts/winmanager'
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|BufExplorer"

function! NERDTree_Start()
	    exec 'NERDTree'
    endfunction
function! NERDTree_IsValid()
	return 1
endfunction
nmap wm :WMToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
