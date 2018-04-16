" Leader is semicolon
let mapleader=";"

" Make code look pretty
let python_highlight_all=1
syntax on

" System clipboard
set clipboard=unnamed

" Don't modify pasted text
set pastetoggle=<F2>

" Change word with yanked text
"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
        silent exe "normal! p"
        endfunction

" Set highlight search
set hlsearch

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Remap for searching the visually selected text
" See http://vim.wikia.com/wiki/Search_for_visually_selected_text
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Proper PEP8 indentation for python files
au BufNewFile,BufRead *.py,*.c,*.cpp,*.h,*.hpp,*.tex
    \ set tabstop=4 | " a hard TAB displays as 4 columns
    \ set softtabstop=4 | " insert/delete 4 spaces when hitting a TAB/BACKSPACE
    \ set shiftwidth=4 | " operation >> indents 4 columns; << unindents 4 columns
    \ set shiftround | " round indent to multiple of 'shiftwidth'
    \ set textwidth=79 " lines longer than 79 columns will be broken
    \ set expandtab | " insert spaces when hitting TABs
    \ set autoindent | " align the new line indent with the previous line
    \ set fileformat=unix |

" Indentation for full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Enable spell checking for LaTex documents
au BufNewFile,BufRead *.tex
		\set spell

" UTF8 support
set encoding=utf-8

set nu " Line numbering

" Quick substitute word under cursor
nnoremap ss *:%s//

" Remap window split commands
nnoremap <C-w>\ <C-w>v
nnoremap <C-w>- <C-w>s

" Use <leader>l and <leader>h to go back and forth in the jump list
nnoremap <leader>l <C-i>
nnoremap <leader>h <C-o>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Easily resize panes
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" move to beginning/end of line
nnoremap B g^
nnoremap E g$

" move vertically by visual line
nnoremap j gj
nnoremap k gk
set nocompatible              " be iMproved, required for Vundle
filetype off                  " required for Vundle

" vim-plug
call plug#begin('~/.config/nvim/plugged')

" Snippet engine
Plug 'SirVer/ultisnips'

" Snippets
Plug 'honza/vim-snippets'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" YouCompleteMe!
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
nnoremap <leader>j :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python'

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" YCM Generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" NeoMake
Plug 'neomake/neomake'

" PEP8 indentation
Plug 'Vimjas/vim-python-pep8-indent'
let g:python_pep8_indent_multiline_string = 1

" Smart pane switching with awareness of Vim splits.
Plug 'christoomey/vim-tmux-navigator'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <F9> :NERDTreeToggle<CR>

" Tagbar
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Fugitive - git for vim
Plug 'tpope/vim-fugitive'
nmap <F6> :Gstatus<CR>

" vim-surround to easily surrond a word etc with e.g. quotes
Plug 'tpope/vim-surround'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '$GIT_CLONES/fzf', 'do': './install --all' }

" Undotree for graphical undo tree representation
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

" LaTeX support with vimtex
Plug 'lervag/vimtex'
let g:vimtex_enabled = 1

" Vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Vim YAML
Plug 'chase/vim-ansible-yaml'

" Initialize plugin system
call plug#end()


" Vimtex + YouCompleteMe
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" When writing a buffer.
call neomake#configure#automake('w')
