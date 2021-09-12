" 基础设置
syntax on                       "语法高亮
set nocompatible                "关闭与vi的兼容模式
set encoding=utf-8              "通用的 utf8 编码，避免乱码
set fenc=utf-8                  "编码
set mouse=a                     "支持使用鼠标
filetype plugin indent on       "开启自动识别文件类型
" 缩进
set tabstop=4                   "tablestop = 4 空格
set softtabstop=4               "
set shiftwidth=4                "
set expandtab                   "将 Tab 转为空格

" 外观
set cursorline                  "光标所在的当前行高亮
set number                      "显示绝对行号
set rnu                         "显示相对行号
set nowrap                      "不自动折行
set showmatch                   "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一半
set cc=80                       "标尺线
set scrolloff=5                   "垂直滚动时，光标距离顶部/底部的行数

" 搜索
set hlsearch                    "搜索时，高亮显示匹配结果
set foldmethod=indent           "代码折叠
set foldcolumn=0                "设置折叠区域的宽度
setlocal foldlevel=1            "设置折叠层数
set foldlevelstart=99           "打开文件是默认不折叠代码

"编辑
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" 根据不同模式，改变光标样式
" Neovim 自带功能
" let &t_SI = "\]50;CursorShape=1\x7"
" let &t_SR = "\]50;CursorShape=2\x7"
" let &t_EI = "\]50;CursorShape=0\x7"
"

"=================================
"          Key Mapping 
"=================================
let mapleader = ","     "leader键改为 ','键
nnoremap <silent><LEADER>1 :1b<CR>
nnoremap <silent><LEADER>2 :2b<CR>
nnoremap <silent><LEADER>3 :3b<CR>
nnoremap <silent><LEADER>4 :4b<CR>
nnoremap <silent><LEADER>5 :5b<CR>
nnoremap <silent><LEADER>6 :6b<CR>
nnoremap <silent><LEADER>7 :7b<CR>
nnoremap <silent><LEADER>8 :8b<CR>
nnoremap <silent><LEADER>9 :9b<CR>

" 标签页操作
nnoremap tn :table              " 打开新的table
nnoremap th :-tabnext<CR>       " 向左跳转table
nnoremap tl :+tabnext<CR>       " 向右跳转table
nnoremap tq :tabclose<CR>       " 关闭table
nnoremap tmh :-tabmove<CR>      " 左移table
nnoremap tml :+tabmove<CR>      " 右移table

set clipboard=unnamedplus   " yy直接复制到系统剪切板

" 自定义习惯按键
noremap <silent><C-S> :w<CR>                " 保存文件
" 匹配文本
nnoremap <C-F> :/
" 全选文本
nnoremap <C-a> ggVG
" 选中状态下复制ctrl+c
vnoremap <C-c> y
" 在插入模式下粘贴 ctrl+v
inoremap <C-v> <ESC>p
" 在插入模式下 向上插入一行
inoremap <C-o> <ESC>O
" 插入模式下光标移动
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
" 标准模式下撤销操作
nnoremap <C-z> u                    " 恢复撤销操作 ctrl-r

nnoremap qq :q<CR>

"=================================
"   vim-plug 插件管理器 
"=================================

call plug#begin('~/.config/nvim/plugged')
        Plug 'iCyMind/NeoSolarized'
        Plug 'luochen1990/rainbow'
        Plug 'Yggdroot/indentLine'
        Plug 'vim-airline/vim-airline'
        Plug 'preservim/nerdtree'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'valloric/youcompleteme'
        Plug 'ervandew/supertab'
        Plug 'octol/vim-cpp-enhanced-highlight'
        " Tags Plugin
        Plug 'universal-ctags/ctags'
        Plug 'ludovicchabant/vim-gutentags'
call plug#end()

let g:coc_global_extensions=[
    \ 'coc-pairs',
    \ 'coc-lists',
    \ 'coc-highlight',
    \ 'coc-snippets',
    \ 'coc-json']



"==========================
"   Plugin NeoSolarized 
"==========================
" 主题设置
set termguicolors
colorscheme NeoSolarized

"==========================
"   Plugin rainbow 
"==========================
" 彩虹括号
let g:rainbow_active = 1

"==========================
"   Plugin IndentLine 
"==========================
" 缩进指示线颜色
let g:indentLine_color_term = 238


"==========================
"   Plugin vim-airline
"==========================
" 状态栏设置
" 打开后可以美化显示窗口 tab 和 buffer，比 NeoVim 自带好看
let g:airline#extensions#tabline#enabled = 1
" tabline 中 buffer 显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

"==========================
"   Plugin nerdtree
"==========================
" 设定 NERDTree 视窗大小
let g:NERDTreeWinSize = 40
" 过滤所有指定的文件不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp','\.swo', '\.vscode', '__pycache__']
" 打开或关闭 nerdtree
map nt :NERDTreeToggle
" 当 NERDTree 为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
" NOTE>正常下 Nerdtree 是不会自动刷新的，按 r 刷新

"==========================================
"   Plugin nvim-cpp-enhanced-highlight
"==========================================
" 启用类范围高亮显示
let g:cpp_class_scope_highlight = 1
" 启用成员变量高亮显示
let g:cpp_member_variable_highlight = 1
" 启用类名声明高亮显示
let g:cpp_class_decl_highlight = 1
" 启用POSIX函数高亮显示
let g:cpp_posix_standard = 1
" 启用模板函数高亮显示NOTE:不一定管用
let g:cpp_experimental_simple_template_highlight = 1
" 备选启用模板函数高亮显示
"let g:cpp_experimental_template_highlight = 1
" enable concepts
let g:cpp_concepts_highlight = 1
" 禁用用户自定义函数高亮显示
let g:cpp_no_function_highlight = 0

"==========================================
"   Plugin youcompleteme  
"==========================================
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" + git command:
" +     git submodule update --init --recursive
" + Depends : 
" +     sudo apt install build-essential cmake vim-nox python3-dev
" + install command:
" +     cd ~/.vim/plugged/YouCompleteMe
" +     python3 install.py --clangd-completer
" ---------------------------------------------------------------- 
let g:ycm_add_preview_to_completeopt = 0 
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_mim_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
" let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
" noremap <c-z> <NOP>
let g:ycm_semantic_triggers = {
    \ 'c, cpp, python, java, go, erlang, perl': ['re!\w{2}'],
    \ 'cs, lua, javascript': ['re!\w{2}'], 
    \ }
" -----------------------------------------------------------------


"==========================================
"   Plugin ctags  
"==========================================
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Depends >
" sudo apt install \
"    gcc make \
"    pkg-config autoconf automake \
"    python3-docutils \
"    libseccomp-dev \
"    libjansson-dev \
"    libyaml-dev \
"    libxml2-dev
" -----------------------------------------------------------
"  install command:
"       cd ctags
"       ./autogen.sh
"       ./configure --prefix=/where/you/want #defaults to /usr/local
"       make
"       make install #may require extra privileges depending on where to install
" -----------------------------------------------------------
" 手册:
" 生成 Tags 命令: 
" ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v 
"       \ --fields=+liaS
"       \ --extra=+q
" -----------------------------------------------------------
" 参数详情:
"c       类classes)
"d       宏定义(macro definitions)
"e       枚举变量(enumerators)
"f        函数定义(function definitions)
"g       枚举类型(enumeration names)
"l        局部变量(local variables)，默认不提取
"m       类、结构体、联合体(class, struct, and union members)
"n       命名空间(namespaces)
"p       函数原型(function prototypes)，默认不提取
"s       结构体类型(structure names)
"t       (typedefs)
"u       联合体类型(union names)
"v       变量定义(variable definitions)
"x       外部变量(external and forward variable declarations)，默认不提取
"----------------------------------------------------------------------------
" 快捷键使用:
" 1. 光标在某个标识符上 通过 Ctrl + ] 可以跳转到定义的位置
" 2. 光标在局部变量上可以使用 gd 跳转到局部变量定义的位置
" 3. Ctrl + o 可以返回到原来的位置
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set tags=./.tags;,.tags



"==========================================
"   Plugin vim-gutentags  
"==========================================
" 搜索工程目录的标志
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

let g:gutentags_ctags_tagfile='.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif


