"plugins
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' } "colorscheme

Plug 'prabirshrestha/vim-lsp' "lsp functionality
Plug 'mattn/vim-lsp-settings' "easier lsp server installations
Plug 'prabirshrestha/asyncomplete.vim' "autocomplete
Plug 'prabirshrestha/asyncomplete-lsp.vim' "lets autocomplete work with vim-lsp

Plug 'ctrlpvim/ctrlp.vim' "fuzzy search
Plug 'tpope/vim-surround' "surrond selections

call plug#end()

let mapleader = "," "leader

"basic settings
set nocompatible "incompatible with vi files

set encoding=utf-8 "encoding

filetype plugin indent on "load plugins correctly

set number "enable line number
set relativenumber "enable relative line numbers

set autoindent "autoindent on new line
set expandtab "set tabs to be spaces
set softtabstop=4
set shiftwidth=4
set shiftround

set showmode
set showcmd

set incsearch
set hlsearch "enable hlsearch
set ignorecase "make searches not case sensitive

set belloff=all

set ruler

let g:lsp_diagnostics_echo_cursor = 1

"TODO: MOVE THESE KEY MAPPING TO A SEPERATE FILE SO ITS NOT SO UGLY IN HERE
imap <c-@> <Plug>(asyncomplete_force_refresh) 

"tab for asyncomplete auto complete
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"surrond selections
vnoremap <silent> * : <C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # : <C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

"turn off highlighting for searches
noremap <C-L> :nohl<CR><C-L>
"U -> redo
nnoremap U <C-R>
"Backspace -> move back a buffer
noremap <bs> <c-^>

"unbind arrow keys
"and if your right hand causes you to sin, cut it off and throw it away.
"it is better for you to lose one part of your body than for your whole
"body to depart into hell
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

",w to switch capitalization of current word
nnoremap <leader>w b~

"F2 -> clear all trailing whitespace
:noremap <F2><CR> :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>

",ss -> set spell check
map <leader>ss :setlocal spell!<cr>

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded
    " by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[4 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

set background=dark "dark backround
set t_Co=256 "terminal colors

let g:dracula_colorterm=0
let g:dracula_italic=0
colorscheme dracula
