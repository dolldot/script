syntax on

set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set rtp+=/home/mri/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug '/home/mri/.fzf/'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

call plug#end()

colorscheme gruvbox
set background=dark

" COC
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json'
    \ ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)




" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']

" ALE
let g:ale_fixers = {}
let g:ale_fixers.javascript = []
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['typescript'] = ['eslint']

" Fix files automatically on save
let g:ale_fix_on_save = 1

" Map keys
inoremap <C-f> <Esc>:ALEFix<CR>
inoremap jj <Esc>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>


