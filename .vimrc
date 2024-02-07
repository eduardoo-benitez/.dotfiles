
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'

call plug#end()

set nocompatible

filetype plugin indent on

set number
set relativenumber

set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

set showmode
set showcmd

set incsearch
set hlsearch
set ignorecase

set belloff=all

let mapleader = ","

let g:lsp_diagnostics_echo_cursor = 1

"TODO: MOVE THESE KEY MAPPING TO A SEPERATE FILE SO ITS NOT SO UGLY IN HERE

imap <c-@> <Plug>(asyncomplete_force_refresh)

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

vnoremap <silent> * : <C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # : <C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

nnoremap U <C-R>
noremap <bs> <c-^>

nnoremap <leader>w b~

:noremap <F2><CR> :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>

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

set background=dark
set t_Co=256

let g:dracula_colorterm=0
colorscheme dracula
