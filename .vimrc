" Leader is semicolon
let mapleader=";"

" Make code look pretty
let python_highlight_all=1
syntax on

" System clipboard
set clipboard=unnamed

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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" SimpylFold
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1 " Show docstrings for folded code

" Auto-indentation
Plugin 'vim-scripts/indentpython.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
nmap <F9> :NERDTreeToggle<CR>

" Auto-complete
Bundle 'Valloric/YouCompleteMe'
" Map <leader>j to YCM GoTo
nnoremap <leader>j :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
let g:ycm_always_populate_location_list = 1

" Syntax checking/highlighting
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Don't use syntastic with python files
let g:syntastic_mode_map = {
			\ "mode": "active",
			\ "passive_filetypes": [] }
			" \ ["python"] }

" YCM Generator
Plugin 'rdnetto/YCM-Generator'

" Vim-Tmux Navigator
Plugin 'christoomey/vim-tmux-navigator'

" Fugitive - git for vim
Plugin 'tpope/vim-fugitive'
nmap <F6> :Gstatus<CR>

" Vimproc
Plugin 'Shougo/vimproc.vim'

" Vim-vebugger
Plugin 'idanarye/vim-vebugger'
let g:vebugger_leader = ";"

" Tagbar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" LaTeX support with vimtex
Plugin 'lervag/vimtex'
let g:vimtex_enabled = 1

" Undotree for graphical undo tree representation
Plugin 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

" Ctrl-P
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Vimtex + YouCompleteMe
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

