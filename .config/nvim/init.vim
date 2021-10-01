call plug#begin('~/.nvim/plugged')

"styling
Plug 'mechatroner/rainbow_csv'
Plug 'gruvbox-community/gruvbox'
Plug 'ap/vim-css-color'

"file manager
Plug 'preservim/nerdtree'       " Tree view Folders and Files

"linter and stuff
Plug 'Shougo/deoplete.nvim'         " Autocomplete
Plug 'deoplete-plugins/deoplete-jedi'

"others
Plug 'tpope/vim-surround'       " Surround with ([{'`\", etc...
Plug 'jiangmiao/auto-pairs'     " Autopair brackets, quotes, etc...
Plug 'tpope/vim-commentary'     " Simple code Commenter
Plug 'unblevable/quick-scope'       " Vim motion highlighting


"fzf 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'



" markdown
Plug 'godlygeek/tabular' 
Plug 'plasticboy/vim-markdown'

" markdown preview
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


" Plug 'joshdick/onedark.vim'
call plug#end()

set number
set ignorecase
set relativenumber
set mouse="" ""check me out
" Replace Tabs with Spaces
set expandtab
" Make Tabs be 4 Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

colorscheme gruvbox

" LaTex
syntax on
filetype plugin indent on

" Compile LateX in the current directory of the terminal
autocmd BufWritePost *.tex !pdflatex %


" Unmap Q: Ex-mode
noremap Q <Nop>


noremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv


" Shortcutting split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" NerdTree
" Toggle NerdTree
noremap <C-n> :NERDTreeToggle<CR>

" Focus NerdTree
"map <C-f> :NERDTreeFocus<CR>


" Uncomment to - save as sudo
command! W :w !sudo tee %

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
set clipboard+=unnamedplus


set encoding=utf-8

" markdown settings

" vim-markdown
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR 
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/nick/.local/lib/github-markdown-css/github-markdown.css'


" preview 
let g:mkdp_refresh_slow = 0


" development
" check me with out

let g:deoplete#enable_at_startup = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'javascript':['eslint']
\}

let g:ale_linters = {
\       'python': ['flake8'],
\       'latex':['texlab'],
\   'javascript':['eslint']
\}


call deoplete#custom#source('ale', 'rank', 999)


" fzf
" sync with Intelij keymaps
nnoremap <silent> <C-p> :Files<CR> 
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <C-f> :Rg<Space>

" Rg command with preview window
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" Hide statusline with fzf
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType Vagrantfile setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType Dockerfile setlocal ts=2 sts=2 sw=2 expandtab

