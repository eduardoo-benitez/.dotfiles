call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

set nocompatible

filetype plugin indent on
syntax on

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

set belloff=all

"TODO: MOVE THESE KEY MAPPING TO A SEPERATE FILE SO ITS NOT SO UGLY IN HERE
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

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

set background=dark
set t_Co=256

let g:dracula_colorterm=0
colorscheme dracula
