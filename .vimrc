
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
Plug 'davidhalter/jedi-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'maralla/completor.vim'
Plug 'morhetz/gruvbox'
Plug 'osamuaoki/vim-spell-under'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()
"============================================================================

" ======================= Plug In Configs ===================================

" NERDTree

map <C-n> :call NERDTreeToggleInCurDir()<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" So vimtex works
let g:polyglot_disabled = ['latex']
let g:tex_flavor = 'latex'
"let g:vimtex_quickfix_autoclose_after_keystrokes = 1

" Git Gutter
set updatetime=250  " Vim update time, defaults to 4000ms
let g:gitgutter_override_sign_column_highlight = 1
set signcolumn=yes

" Comfortable vim - scrolling
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(80)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-80)<CR>

" Ale
let g:ale_set_highlights = 0  " Dont underline errors/warnings
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
hi link ALEErrorSign    GruvboxRed
hi link ALEWarningSign  GruvboxYellow
noremap <silent> gd :ALEGoToDefinition<CR>
noremap <silent> gr :ALEFindReferences<CR>

" Vim-tmux-navigator support for :term
if has('terminal')
	tmap <c-k> <c-w>:TmuxNavigateUp<cr>
	tmap <c-j> <c-w>:TmuxNavigateDown<cr>
	tmap <c-h> <c-w>:TmuxNavigateLeft<cr>
	tmap <c-l> <c-w>:TmuxNavigateRight<cr>
endif

" Polyglot
let g:python_highlight_space_errors = 0

set splitbelow "donde aparecen los nuevos splits
set splitright "donde aparecen los nuevos splits
set diffopt+=vertical
set background=dark
set number
set hlsearch
set incsearch
set nofoldenable
"case insensitive search
set ignorecase
set smartcase

" Syntax
syntax on

" " For ALE linter plugin
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

" Fix backspace
set backspace=indent,eol,start

" Enable mouse
set mouse=a
" if !has('nvim')
"     set ttymouse=xterm2
" endif
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

" Share clipboard with OS, it can destroy your normal yank, wtf!
set clipboard=unnamed

" This fixes problem with background being bright on lines with text and black
" on lines without text, when using vim inside tmux, and with true color
" Details: https://github.com/mhartington/oceanic-next/issues/40
"          https://github.com/vim/vim/issues/804
"           http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set t_ut=

" ======= FZF =============
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :GGrep<CR>
nnoremap <C-g>a :Ag<CR>
nnoremap <C-g>c :Commands<CR>
nnoremap <C-g>h :History:<CR>
nnoremap <C-g>l :BLines<CR>
nnoremap <C-g>g :GFiles<CR>
nnoremap <C-p> :Files<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--no-hscroll --delimiter : --nth 3..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--no-hscroll --delimiter : --nth 3..'}, 'right:50%'),
  \   <bang>0)
" ==========================

" ==========================
" " -- Visuals --
let g:gruvbox_termcolors = 16
"colorscheme gruvbox
let g:spell_under='gruvbox'
set background=dark
set scrolloff=2
hi Normal ctermbg=0
hi StatusLine ctermbg=red ctermfg=black
set laststatus=2
set noshowmode
set statusline=%=%f%m\ %P\|%c\ %{ALEGetStatusLine()}

"Remaps
command Noh noh
command NOh noh
