
filetype indent plugin on

" automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/noahfrederick/vim-noctu'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maralla/completor.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()
"============================================================================

" ======================= Plug In Configs ===================================


" Git Gutter
set updatetime=250  " Vim update time, defaults to 4000ms
let g:gitgutter_override_sign_column_highlight = 1

" Ale
let g:ale_set_highlights = 0  " Dont underline errors/warnings
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
hi link ALEErrorSign    GruvboxRed
hi link ALEWarningSign  GruvboxYellow

" Polyglot
let g:python_highlight_space_errors = 0

set splitbelow "donde aparecen los nuevos splits
set splitright "donde aparecen los nuevos splits
set diffopt+=vertical
syntax on
set background=dark
set number
set hlsearch

" " For ALE linter plugin
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

" Fix backspace
set backspace=indent,eol,start

" Enable mouse
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

" Share clipboard with OS, it can destroy your normal yank, wtf!
set clipboard=unnamed

" " -- Visuals --
let g:gruvbox_termcolors = 16
colorscheme gruvbox
set background=dark
hi Normal ctermbg=0
hi StatusLine ctermbg=red ctermfg=black
set laststatus=2
set noshowmode
set statusline=%=%f%m\ %P\|%c\ %{ALEGetStatusLine()}
