" ▲ GENERAL
set mouse=a
set number
set relativenumber " Show rel. number
set wrap	   " Wrap lines
set linebreak	   " Break lines at word (requires Wrap lines)
set showmatch	   " Highlight matching brace
"                   
set hlsearch	   " Highlight all search results
set smartcase	   " Enable smart-case search
set noignorecase   " Always case-sensitive
set incsearch	   " Searches for strings incrementally
"
set nosplitbelow   "Open new split panes above
set splitright	   " Open new split panes right

" ▲ ENABLE FILETYPE, INDENT, AND DETECTION
filetype plugin indent on
" Set LaTeX as first choice when *.tex file is detected
let g:tex_flavor = "latex"

" ▲ FOLDING
set foldmethod=manual
autocmd BufWinLeave ?* mkview                  " automatic folding
autocmd BufWinEnter ?* silent! loadview	       " automatic load folder

" ▲ LIGHTLINE SETTINGS
set laststatus=2  " show bar
set noshowmode	" not show current mode
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }

" ▲ ADVANCED
set ruler	                " Show row and column ruler information
                                 
set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set ttimeoutlen=50              " Adjust delay between passing from normal to insert mode
set timeoutlen=1000		" Adjust mappings delay
set showcmd			" Show leader key in the bottom right corner for the duration of the timeout

" ▲ MAPS
" 
"■ DEFINE <LEADER> KEY
let mapleader = "\<tab>"	"map leader key to Tab

" ■ VISUAL-BLOCK REMAP ON <CTRL-v>
noremap <C-q> <C-v>

" ■ COPY AND PASTE
" Copy and Paste using global clipboard
noremap <C-c> "+y
noremap <C-v> "+p
" Paste from 0 register
" That not allow to delete text to be pasted
noremap <Leader>p "0p 
" Copy entire line without newline character
noremap Y ^y$
" Delete entire line without newline character
noremap D ^d$

" ■ MOVEMENT
" Moving down and up by screen lines
noremap <Up> gk
noremap! <Up> <C-O>gk
noremap <Down> gj
noremap! <Down> <C-O>gj
" Swapping lines
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==
inoremap <M-Down> <Esc>:m .+1<CR>==gi
inoremap <M-Up> <Esc>:m .-2<CR>==gi
vnoremap <M-Down> :m '>+1<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv

" ■ REMAP <ESC> KEY IN INSERT MODE
inoremap jk <ESC>

" ■ MAP UNJOIN LINE
noremap <C-j> i <CR> <ESC> d0 k_

" ■ MAP USEFUL COMMANDS
" Map :buffers command
nnoremap <Leader>b :buffers<CR>
" Map :ju[mps] command
nnoremap <Leader>j :jumps<CR>
" Map :noh command
nnoremap <Leader>n :noh<CR>
" Map :reg command
nnoremap <Leader>r :reg<CR>
" Map :ter command
nnoremap <Leader>t :silent! ter<CR>
" Map :updates command
nnoremap <Leader>u :update<CR>
" Map :w !sudo tee % command
nnoremap :w!! :w !sudo tee %<CR>

" ■ MAP WINDOWS
" Map windows related keys
nnoremap <Leader>w <C-W>
" Map windows related keys
nnoremap <Leader>w+ :resize +10<CR>
" Map windows related keys
nnoremap <Leader>w- :resize -10<CR>
" Map windows related keys
nnoremap <Leader>w> :vertical results +10<CR>
" Map windows related keys
nnoremap <Leader>w< :vertical results -10<CR>
"

" ▲ PLUGIN
"
" ▲ FERN PLUGIN
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1


augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END


function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction


" Custom settings and mappings.
let g:fern#disable_default_mappings = 1


noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=


function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction


augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" ▲ VIM-PLUG & SIMILAR
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ■ ULTISNIPS plugin 
" All edits are taken from https://castel.dev/post/lecture-notes-1/
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"LIGHTLINE plugin
Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename' ] ],
    \	'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileencoding', 'filetype', 'cutfromright' ] ]
    \ },
    \ 'component': {
    \	'cutfromright': '%<'
    \ },
    \ }

" ■ COMMENTARY.VIM plugin
Plug 'tpope/vim-commentary'
autocmd FileType octave setlocal commentstring=#\ %s

" ■ SURROUND.VIM plugin
"Plug 'tpope/vim-surround'
"
" ■ VIM MULTIPLE CURSOR plugin
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" ■ FERN VIM FILESYSTEM plugin
Plug 'lambdalisue/fern.vim'

call plug#end()

" ▲ OCTAVE SYNTAX
augroup filetypedetect
au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" ▲ SET FORWARD LATEX SEARCH
function! SyncTexForward()
let linenumber=line(".")
let colnumber=col(".")
let filename=bufname("%")
let filenamePDF=filename[:-4]."pdf"
let execstr="!zathura --synctex-forward " . linenumber . ":" . colnumber . ":" . filename . " " . filenamePDF . "&>/dev/null &"
exec execstr 
endfunction
nmap :call SyncTexForward()
nnoremap <Leader>lav :call SyncTexForward()<CR>

" ▲ COLORSCHEME
" nord
colorscheme nord

" ▲ MACRO
" Macro che automatizza l'editing del file della musica
let @m = '$F-dt.j'
