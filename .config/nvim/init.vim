"plugins with vim-plug
call plug#begin('~/.vim/plugged') 

"theme
Plug 'arcticicestudio/nord-vim'

"status bar
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"general syntax
Plug 'sheerun/vim-polyglot'

"python indent plugin
Plug 'Vimjas/vim-python-pep8-indent'

"hex colors
Plug 'ap/vim-css-color'

"find files/text (both brew install fzf and ripgrep are required)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"editor config
Plug 'editorconfig/editorconfig-vim'

"code autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-python'] "for coc-python, it's required a $ pip install jedi

"auto close tags
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

"markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"git plugin
Plug 'tpope/vim-fugitive'

"source tree
Plug 'scrooloose/nerdtree'
let g:NERDTreeMinimalUI=1 "disable display of ? text and bookmarks
let g:NERDTreeQuitOnOpen = 1 "always close nerdtree when a file is opened
let g:NERDTreeWinSize=50 "increasing window size
let NERDTreeShowLineNumbers=1 "show line numbers on NERDTree
autocmd FileType nerdtree setlocal relativenumber "the line numbers are relative
let NERDTreeShowHidden=1 "show dotfiles

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/dim.vim
source ~/.config/nvim/floating.vim
