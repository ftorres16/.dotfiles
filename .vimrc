syntax on
set background=dark
set number

filetype indent plugin on

" automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'maralla/completor.vim'
Plug 'https://github.com/w0rp/ale.git'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

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

" " For ALE linter plugin
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

" Fix backspace
set backspace=indent,eol,start

" " -- Visuals --
set statusline=%=%f%m\ %P\|%c\ %{ALEGetStatusLine()}
