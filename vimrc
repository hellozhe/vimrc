""使用Vundle进行插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"配置Vundle所需参数
set nocompatible              "关闭vi兼容模式
filetype off                  "关闭文件类型检测

"配置Vundle环境变量
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle插件管理区域开始标签
call vundle#begin()

"使用Vundle管理自身插件
Plugin 'gmarik/Vundle.vim'

"使用Vundle管理位于GitHub上的插件(可选)
Plugin 'scrooloose/nerdtree'           "树形目录
Plugin 'jistr/vim-nerdtree-tabs'       "为树形目录提供Tab支持
Plugin 'vim-scripts/minibufexpl.vim'   "多文件编辑
Plugin 'vim-scripts/taglist.vim'       "基于ctags的代码Tag浏览
Plugin 'vim-scripts/pydiction'         "Python语法结构自动补全
Plugin 'vim-scripts/autocomplpop'      "文本内容自动补全
"Plugin 'vim-scripts/pyflakes'          "实时检查python代码语法

"Vundle插件管理区域结束标签
call vundle#end()
"针对不同的文件类型加载对应的插件并允许开启自动补全
filetype plugin indent on

""快捷键选项
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"u                            "撤销最后的改动
"CTRL+r                       "重做最后的改动
"CTRL+v                       "块编辑模式[删除x][插入I][退出ESC]
"CTRL+x CTRL+f                "文件路径补全

""配置选项(可选)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme inkpot           "配色模式inkpot
"colorscheme SolarizedDark    "配色模式SolarizedDark
"colorscheme jellybeans       "配色模式jellybeans
set history=400              "增加历史操作命令条数，默认20
set expandtab                "使用空格替换Tab符
set tabstop=4                "设置Tab键的宽度
set smarttab                 "智能使用Tab键
"set shiftwidth=4             "换行时行间交错使用4个空格
set autoindent               "自动缩进
"set cindent shiftwidth=4     "自动缩进4空格
"set smartindent              "智能缩进
set backspace=2               "设置退格键可用
"set nu                       "显示行号
set showmatch                "显示括号配对情况
"set mouse=a                  "启用鼠标
"set ruler                    "启用状态栏标尺
"set incsearch                "开启实时搜索功能
set hlsearch                 "开启高亮显示搜索结果
"set smartcase                "开启智能大小写搜索
"set ignorecase               "搜索时忽略大小写
"set nowrapscan               "搜索到文件两端时不重新搜索
set vb t_vb=                 "关闭提示音
set cursorline               "突出显示当前行
"set cursorcolumn             "突出显示当前列
set hidden                   "允许在有未保存的修改时切换缓冲区
"set wildmenu                 "启动增强模式下的命令行自动完成
"set cmdheight=2              "设置命令行高度
"set autoread                 "自动读取被外部修改的文件内容
"set autowrite                "开启自动保存
set nowrap                   "不自动换行
"set backup                   "自动备份修改前的文件为源文件名加~
"set noswapfile               "编辑时不产生交换文件
"set autochdir                "自动切换当前目录为文件所在的目录
"set equalalways              "分割窗口时保持相等的宽和高

"优化退格键的行为
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"显示Tab符并使用高亮竖线代替
set list
set listchars=tab:\|\ ,

syntax enable                "打开语法高亮
syntax on                    "开启文件类型侦测

"每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.py,*.rb,*.erb,*.vim 2match Underlined /.\%81v/

"自定义状态栏显示(文件名称,文件格式,文件类型,光标字符ASCII与16进制值,光标所在行号和列号,文件总行数)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set laststatus=2             "总是显示状态栏

set fileformats=unix,dos,mac "自动识别文件格式

"设置默认编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"解决Consle乱码输出问题
language messages zh_CN.utf-8
"language messages en_US.utf-8

""插件配置(可选)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
let Tlist_Use_Right_Window = 1                 "在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             "自动折叠
let Tlist_Show_One_File = 1                    "只显示当前文件的tags
let Tlist_Exit_OnlyWindow = 1                  "如果Taglist窗口是最后一个窗口则退出Vim

"通过快捷键<F5>开关Taglist
nnoremap <silent> <F5> :Tlist<CR>

"通过快捷键<F4>开关NERDTree
nnoremap <silent> <F4> :NERDTreeTabsToggle<CR>

"通过快捷键<F8>切换窗口
nnoremap <silent> <F8> <C-W>w

"通过快捷键<F7>启用Pyflakes
"autocmd FileType python map <buffer> <F7> :call Pyflakes()<CR>

"通过快捷键<F6>开关粘贴模式临时关闭自动缩进等功能方便从外部复制代码
set pastetoggle=<F6>

"Python语法结构自动补全[pydiction]
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

"Minibufexpl多文件编辑
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1 

""引号,括号自动匹配(可选)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
"
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
"
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
"
"":inoremap < <><ESC>i
"":inoremap > <c-r>=ClosePair('>')<CR>
"
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"
":inoremap ` ``<ESC>i
"
"function ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endf


""自定义函数(可选)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"加载语法模板和作者,时间信息[非插入模式]
function MyInfo()
    call append(0, "#!/usr/bin/env perl")
    call append(1, "")
    call append(2, "# FileName: ".expand("%"))
    call append(3, "# Date: ".strftime("%c"))
    call append(4, "# Author: xiaozhezhu")
    call append(5, "")
    call append(6, "use warnings;")
    call append(7, "use strict;")
    call append(8, "use Smart::Comments")
endf

function MyMain() 
    call append(line("."),   "def main():")
    call append(line(".")+1, "")
    call append(line(".")+2, "if __name__=='__main__':")
    call append(line(".")+3, "    main()")
endf

"映射到快捷键
map <F2> <Esc>:call MyInfo()<CR><Esc>
map <F3> <Esc>:call MyMain()<CR><Esc>
