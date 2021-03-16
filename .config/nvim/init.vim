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
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-python', 'coc-flow', 'coc-java'] "for coc-python, it's required a $ pip install jedi

"auto close tags
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

"git plugin
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"source tree
Plug 'scrooloose/nerdtree'
let g:NERDTreeMinimalUI=1 "disable display of ? text and bookmarks
let g:NERDTreeQuitOnOpen = 1 "always close nerdtree when a file is opened
let g:NERDTreeWinSize=50 "increasing window size
let NERDTreeShowLineNumbers=1 "show line numbers on NERDTree
autocmd FileType nerdtree setlocal relativenumber "the line numbers are relative
let NERDTreeShowHidden=1 "show dotfiles

"git indications for source tree
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

call plug#end()

set encoding=UTF-8                  "UTF-8
set nocompatible                    "use vim settings instead of vi's
set autoread                        "reload file if changed outside vim
filetype plugin indent on           "minimal config
set clipboard=unnamedplus           "use system's clipboard
set expandtab                       "tabs are spaces
set number                          "show line numbers
set relativenumber                  "show relative numbers instead of absolute
set cursorline                      "highlight current line
set showcmd                         "show command in bottom bar
set inccommand=split                "show a previous of the result of a command
set showmatch                       "highlight matching [{()}]
set incsearch                       "search as characters are entered
set hlsearch                        "highlight matches
let mapleader = "\<Space>"          "changing leader key to SPACE
set noswapfile                      "removing swap files feature
set wildmenu                        "display command line's tab complete options as a menu.
set ignorecase                      "ignore case when searching
set smartcase                       "unless you type a capital

set tabstop=2                       "size of a hard tabstop
set expandtab                       "always use spaces instead of tabs
set shiftwidth=2                    "size of an indent

set splitbelow                      "new horizontal splits are on the bottom
set splitright                      "new vertical splits are on the right


"avoid vim from wraping text at 80 column width mark
set nowrap
set wrapmargin=0
set textwidth=0
set formatoptions-=t
set colorcolumn=

"theme related
colorscheme nord 
set guifont=MonoLista:h14           "font
set background=dark                 "set dark mode
set termguicolors                   "proper colors for the theme
syntax on                           "enable syntax processing

"removing the help banner from netrw
let g:netrw_banner = 0

"set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

"preventing syntax highlighting to get out of sync
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"
"dim inactive window
hi def Dim cterm=none ctermbg=none ctermfg=242

function! s:DimInactiveWindow()
    syntax region Dim start='' end='$$$end$$$'
endfunction

function! s:UndimActiveWindow()
    ownsyntax
endfunction

autocmd WinEnter * call s:UndimActiveWindow()
autocmd BufEnter * call s:UndimActiveWindow()
autocmd WinLeave * call s:DimInactiveWindow()
"
"to map CAPS to be both CTRL and ESC read this: https://medium.com/@pechyonkin/how-to-map-capslock-to-control-and-escape-on-mac-60523a64022b

"open easily vim config
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

"mode between split windows easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"maping buffers list
nnoremap <leader>b :Buffers<CR>

"maping buffer split
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>x :split<CR>

"switch between current and last buffer
nnoremap <leader>. <c-^>

"files search
nnoremap <leader>p :GFiles<CR>

"text search inside files
nnoremap <leader>f :Rg<CR>

"open source tree
nnoremap <leader>] :NERDTreeToggle<CR>

"open source tree on current file 
nnoremap <leader>[ :NERDTreeFind<CR>


"----
"---- BEGIN COC SETUP
"----

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"setup prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"----
"---- END COC SETUP
"----

nmap <leader>do <Plug>(coc-codeaction)
