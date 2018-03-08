"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                                          " no backward compatibility with vi 
set ttyfast                                                               " fast redraw
set autoread                                                              " detect when a file is changed
set number                                                      					" display numbers on left
set relativenumber                                               					" display relative numbers on left
set hidden                                                    						" dont unload buffer when switching away
set modeline                                                  						" allow per-file settings via modeline
set exrc                                                      						" enable per-directory .vimrc files
set secure                                                    						" disable unsafe commands in local .vimrc files
set nobackup nowritebackup noswapfile autoread                						" no backup or swap
set hlsearch incsearch ignorecase smartcase                   						" search related
set wildmenu                        																			" completion
set backspace=indent,eol,start      																			" sane backspace
set clipboard=unnamed,unnamedplus   																			" use system clipboard for yank/put/delete
set mouse=a                         																			" enable mouse for all modes settings
set mousehide                       																			" dont hide the mouse cursor while typing
set mousemodel=popup                																			" right-click pops up context menu
set ruler                           																			" show cursor position in status
set nofoldenable                    																			" no code folding by default
set scrolloff=10                    																			" scroll the window so I can always see 10 lines around the cursor
set textwidth=80                                              						" show a vertical line at the 79th character
set cursorline                                                						" highlight the current line
set printoptions=paper:letter                                 						" use letter as the print output format
set guioptions-=T                                             						" turn off GUI toolbar (icons)
set guioptions-=r                                             						" turn off GUI right scrollbar 
set guioptions-=L                                             						" turn off GUI left scrollbar
set laststatus=2                                              						" always show status bar
set tags=./.git/tags,tags;$HOME                                    				" check the parent directories too for tags.

syntax enable                                                   					" enable syntax
filetype plugin indent on                                       					" recognize the file type for indentation   


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
augroup vimrc_autocmd
  autocmd!
  autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent! wa 						" auto save buffer
  autocmd filetype c,asm,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead *.hdbs setlocal ft=mustache
  autocmd filetype gitcommit setlocal colorcolumn=50,70
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Close vim if only nerd tree window is open

  autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  autocmd FileType python source ~/.vimrc_python
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Max Line Marker 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80              																			  " Show the 80th char column.
highlight ColorColumn ctermbg=5 guibg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Generic Plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugins')
Plug 'yggdroot/indentline'
Plug 'ternjs/tern'
Plug 'w0rp/ale'                                         								" async lint engine
Plug 'airblade/vim-gitgutter'                                     			" for git diff
Plug 'vim-airline/vim-airline'                                    			" status line
Plug 'vim-airline/vim-airline-themes'                                   " themes
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'                                         			" git integration
Plug 'tpope/vim-surround'                                         			" all about surroundings: parentheses, brackets, quotes, XML tags
Plug 'scrooloose/nerdcommenter'                                         " for commenting
Plug 'valloric/youcompleteme'                                           " A CODE-COMPLETION ENGINE FOR VIM
Plug 'scrooloose/nerdtree'                                              " file system explorer for the Vim editor
Plug 'jiangmiao/auto-pairs'
Plug 'elzr/vim-json'
Plug 'sheerun/vim-polyglot', {'for': 'javascript'}      								" highlighting
Plug 'ashisha/image.vim'
Plug 'honza/vim-snippets'
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'} 
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'othree/html5.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Colorscheme 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
set background=light
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Pymode, python settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode = 1
let g:pymode_options_max_line_length=80
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_motion = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               YouCompleteMe Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Javascript settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Nerd commenter Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1                               					" Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                           					" Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1                         					" Allow commenting and inverting empty lines (useful when commenting a region) 
let g:NERDTrimTrailingWhitespace = 1                    					" Enable trimming of trailing whitespace when uncommenting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Nerd tree Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            airline configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_section_x = ''                                      " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = ''                                      " Do not list file encoding
let g:airline_solarized_bg='dark'
set ttimeoutlen=50
let g:airline_highlighting_cache = 1
set t_Co=256                                            					" required for the powerline/airline bg
let g:airline_section_z = '%3pp %l:%c'
let g:airline_section_error=""
let g:airline_section_warning=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Ctrl-P Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.pyc/*        
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn|pyc)$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            ale configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_completion_enabled=1
let g:ale_sign_error='>>'
let g:ale_sign_warning='--'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
let g:mapleader = ","
nnoremap <C-J> <C-W><C-J>                               					" move to buffer below
nnoremap <C-K> <C-W><C-K>                               					" move to buffer above
nnoremap <C-L> <C-W><C-L>                               					" move to buffer right
nnoremap <C-H> <C-W><C-H>                               					" move to buffer left
nnoremap <C-Z> <C-W><C-Z>                               					" close preview window
nnoremap <C-A> <C-W><C-}>                               					" preview function/class definition
nnoremap <C-n> :NERDTreeToggle<CR>                           			" Toggle nerdTree
nnoremap <leader>ss :setlocal spell!<CR>                          " Pressing ,ss will toggle and untoggle spell checking"
nnoremap <leader>sn ]s                                            " next spell error
nnoremap <leader>sp [s]                                           " previous spell error
nnoremap <leader>ev :e! ~/.vimrc<cr>                              " edit ~/.vimrc"

nnoremap <leader>qd <C-W><C-J> :q<CR>
nnoremap <leader>qu <C-W><C-K> :q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Strict Mode settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Arrow keys in Escape mode
noremap <up> :<C-u>echo "Arrow keys are disabled for escape mode"<CR>
noremap <down> :<C-u>echo "Arrow keys are disabled for escape mode"<CR>
noremap <right> :<C-u>echo "Arrow keys are disabled for escape mode"<CR>
noremap <left> :<C-u>echo "Arrow keys are disabled for escape mode"<CR>

" Disable Arrow keys in escape mode
inoremap <up> <C-o>:echo "Arrow keys are disabled for insert mode"<CR>
inoremap <down> <C-o>:echo "Arrow keys are disabled for insert mode"<CR>
inoremap <right> <C-o>:echo "Arrow keys are disabled for insert mode"<CR>
inoremap <left> <C-o>:echo "Arrow keys are disabled for insert mode"<CR>

" Disable Arrow keys in insert mode
vnoremap <up> :<C-u>echo "Arrow keys are disabled for visual mode"<CR>
vnoremap <down> :<C-u>echo "Arrow keys are disabled for visual mode"<CR>
vnoremap <right> :<C-u>echo "Arrow keys are disabled for visual mode"<CR>
vnoremap <left> :<C-u>echo "Arrow keys are disabled for visual mode"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Pathogen load 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on


let g:indentLine_char = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             References
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         https://vimawesome.com
