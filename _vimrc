" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

set nocompatible
filetype off

set nobackup
set noswapfile
"set noundofile
set undodir=$HOME/.vim/undo
set directory=$HOME/.vim/swp

syntax on
color desert
set hlsearch
set incsearch

set guioptions-=T
set guioptions-=m

set number
set showcmd
set ruler
set cursorline
set scrolloff=0

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent

set fencs=utf-i,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set foldlevel=99
set foldmethod=indent
set foldenable

set backspace=2
set showmatch
let mapleader="\\"

"===== self definite key-maps =====
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

"===== vundle =====
" :PluginInstall
" :PluginUpdate
" :PluginClean
" :PluginList
" :PluginSearch

set rtp+=$VIM/bundle/Vundle.vim     " vundle install path

call vundle#begin('$VIM/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'            " script_id=1658
Plugin 'scrooloose/nerdcommenter'       " script_id=1218
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'taglist.vim'                    " script_id=273
Plugin 'fholgado/minibufexpl.vim'       " script_id=159
Plugin 'a.vim'                          " script_id=31
Plugin 'yegappan/grep'                  " script_id=311
Plugin 'tpope/vim-surround'             " script_id=1697
Plugin 'jreybert/vim-align'             " script_id=294 Align
Plugin 'junegunn/vim-easy-align'
Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'Rip-Rip/clang_complete'        " script_id=3302
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'inkarkat/vim-ingo-library'      " script_id=4433
Plugin 'inkarkat/vim-mark'              " script_id=2666, depend on vim-ingo-library
Plugin 'Yggdroot/indentLine'            " script_id=4354
Plugin 'vim-scripts/indentpython.vim'

call vundle#end()

filetype plugin indent on
"===== vundle =====

" ctags
set tags+=tags
"set autochdir
nnoremap <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
inoremap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Plugin vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project'] " the Flags to search project root path
let g:gutentags_ctags_tagfile = '.tags' " tags file name to generated
"let s:vim_tags = expand('~/.cache/tags') " move all auto-generated tags file into ~/.cache/tags
"let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px'] " parameters for ctags

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap <F6> :!cscope -Rbq<CR>
nnoremap <F7> :cs add cscope.out .<CR>

" QuickFix
nmap <C-N> :cn<cr>
nmap <C-P> :cp<cr>

" new-omni-completion
set completeopt=longest,menu

" Plugin 'scrooloose/nerdtree'        " script_id=1658
nnoremap <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif  " auto close NERDTree if it it the last file opened
let NERDTreeShowBookmarks=1                     " display bookmarks list
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_autoclose = 1

" Plugin 'yegappan/grep'              " script_id=311
nnoremap <silent> <F3> :Grep -r<CR>

" Plugin 'taglist.vim'                " script_id=273
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Process_File_Always = 1
let Tlist_Exit_OnlyWindow = 1
":set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%) " display the current tag name in the status line

" Plugin 'inkarkat/vim-mark'          " script_id=2666, depend on vim-ingo-library
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear 
let g:mwHistAdd='/@'

" Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plugin 'fholgado/minibufexpl.vim'   " script_id=159
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

" Plugin 'Rip-Rip/clang_complete'     " script_id=3302
"let g:clang_library_path='D:\Software\tools\llvm+clang-7.0.0-win64-msvc-release\bin\libclang.dll'

"" Plugin 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = '$VIM/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
"" only for files that have been opened or included
"nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" Plugin Jedi-vim
"let g:jedi#environment_path = "c:/program files/python36"
let g:jedi#goto_command = "<leader>d"


" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

