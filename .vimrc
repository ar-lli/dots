" ▲ GENERAL {{{
set mouse=a
" Serve ad alacritty per far funzionare il mouse correttamente
set ttymouse=sgr
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
set nosplitbelow   " Open new split panes above
set splitright	   " Open new split panes right
" }}}  

" ▲ ENABLE FILETYPE, INDENT, AND DETECTION {{{
filetype plugin indent on
" Set LaTeX as first choice when *.tex file is detected
let g:tex_flavor = "latex"
" }}} 

" ▲ FOLDING {{{
set foldmethod=marker
" set foldmethod=marker for vim files
" augroup filetype_file
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
"     autocmd FileType conf setlocal foldmethod=marker
"     autocmd FileType zsh setlocal foldmethod=marker
" augroup END
autocmd BufWinLeave ?* mkview                  " automatic folding
autocmd BufWinEnter ?* silent! loadview	       " automatic load folder
" }}} 

" ▲ ADVANCED {{{
set ruler	                " Show row and column ruler information
set wildmenu
set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set timeout ttimeout
set ttimeoutlen=10              " Adjust delay between passing from normal to insert mode
set timeoutlen=1000		" Adjust mappings delay
set showcmd			" Show leader key in the bottom right corner for the duration of the timeout
"  }}}

" ▲ NETRW {{{ 
"
" augroup InitNetrw
" 	autocmd!
" 	autocmd VimEnter * if expand("%") == "" | edit . | endif
" augroup END
"
" ■ GENERAL {{{

let g:netrw_keepdir = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search
" }}} 
"
" ■ NAVIGATION {{{
"
function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  " nmap <buffer> p " Open a preview window
  nmap <buffer> P <C-w>z

  nmap <buffer> V v<C-w>l<C-w>=<C-w>h
  nmap <buffer> H o<C-w>L<C-w>J<C-w>k<C-w>H
  nmap <buffer> T t

  " create new file
  nmap <buffer> ff %:w<CR>:buffer #<CR>
  " rename a file
  nmap <buffer> fe R 
  " Will copy the marked files.  
  nmap <buffer> fc mc
  "  We will use this to skip a step. After you mark your files you can put the cursor in a directory and this will assign the target directory and copy in one step.
  nmap <buffer> fC mtmc
  " Will move marked files
  nmap <buffer> fx mm
  " Same thing as fC but for moving files
  nmap <buffer> fX mtmm
  " Will be running external commands on the marked files
  nmap <buffer> f; mx

  " To create a bookmark
  nmap <buffer> bb mb
  " To remove the most recent bookmark
  nmap <buffer> bd mB
  " To jump the most recent bookmark
  nmap <buffer> bl gb

  " Toggles the mark on a file or directory
  nmap <buffer> <Space> mf
  " Will unmark all the files in the current buffer
  nmap <buffer> <S-Space> mF
  " Will remove all the marks on all files
  nmap <buffer> <Leader><Space> mu
endfunction
"
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
"
"  }}}
"
"  }}}

" ▲ MAPS {{{
" 
" ■ DEFINE <LEADER> KEY {{{
let mapleader = "\<tab>"	"map leader key to Tab
" }}}

" ■ VISUAL-BLOCK REMAP ON <CTRL-v> {{{
noremap <C-q> <C-v>
"  }}}

" ■ COPY AND PASTE {{{
" Copy and Paste using global clipboard
noremap <C-c> "+y
noremap <C-v> "+p
" Paste from 0 register
" That not allow to delete text to be pasted
noremap <Leader>p "0p 
" Copy entire line without newline character
noremap Y ^yg_
" Delete entire line without newline character
noremap D ^dg_
" }}} 

" ■ MOVEMENT {{{
" Remap k and j as jumps
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
" Remap H and L to go to beginning and end of line
nnoremap H 0
nnoremap L $
onoremap H 0
onoremap L $
" Moving down and up by screen lines
noremap <Up> gk
noremap <Down> gj
"noremap! <Up> <C-O>gk
"noremap! <Down> <C-O>gj
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
"Map <C-h> e <C-h> per muovere il cursore a sx/dx in insert mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" }}} 

" ■ REMAP <C-i> TO <C-p> {{{
noremap <C-j> <C-p>
" }}}

" ■ REMAP <ESC> KEY IN INSERT MODE {{{
inoremap jk <ESC>
" }}}

" ■ MAP UNJOIN LINE {{{
noremap <C-j> i<CR><ESC>d0k_
" }}} 

" ■ MAP USEFUL COMMANDS {{{
" Map :q command
nnoremap <Leader>q :q<CR>
" Map :qa command
nnoremap <Leader>aq :qa<CR>
" Map :source .vimrc file command
nnoremap <Leader>so :source $MYVIMRC<CR>
" Map :buffers command
nnoremap <Leader>b :buffers<CR>
" Map :ju[mps] command
nnoremap <Leader>j :jumps<CR>
" Map :changes command
nnoremap <Leader>c :changes<CR>
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
" Map netrw
" nnoremap <Leader>f :Lexplore<CR>
" Map fern drawer toggle
nnoremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR>
" }}} 

" ■ MAP WINDOWS AND TABS {{{
nnoremap <Leader>ll g<Tab>
" }}}

" ■ SURROUND MAPPING {{{
" Map <Leader>( in normal mode to surround word-under-cursor with ()
nnoremap <Leader>( viw<esc>Bi(<esc>Ea)<esc>
" Map <Leader>( in visual mode to surround selection with ()
vnoremap <Leader>( <esc>`>a)<esc>`<i(<esc>f)
" Map <Leader>{ in normal mode to surround word-under-cursor with {}
nnoremap <Leader>{ viw<esc>Bi{<esc>Ea}<esc>
" Map <Leader>{ in visual mode to surround selection with {} 
vnoremap <Leader>{ <esc>`>a}<esc>`<i{<esc>f}
" Map <Leader>[ in normal mode to surround word-under-cursor with []
nnoremap <Leader>[ viw<esc>Bi[<esc>Ea]<esc>
" Map <Leader>[ in visual mode to surround selection with []
vnoremap <Leader>[ <esc>`>a]<esc>`<i[<esc>f]
" Map <Leader>" in normal mode to surround word-under-cursor with " 
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>E
" Map <Leader>" in visual mode to surround selection with " 
vnoremap <Leader>" <esc>`>a"<esc>`<i"<esc>f"
" Map <Leader>' in normal mode to surround word-under-cursor with ' 
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>E
" Map <Leader>' in visual mode to surround selection with '
vnoremap <Leader>' <esc>`>a'<esc>`<i'<esc>f'
" }}} 

" ■ DISABLING KEYS {{{
nnoremap 0 <nop>
nnoremap $ <nop>
" }}} 

" }}} 

" ▲ PLUGIN {{{
" ▲ VIM-PLUG & SIMILAR
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
 call plug#begin('~/.vim/plugged')

" ■ ULTISNIPS plugin {{{
" All edits are taken from https://castel.dev/post/lecture-notes-1/
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }}} 

" ■ LIGHTLINE plugin {{{
Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'absolutepath' ] ],
    \	'right': [ [ 'percent', 'lineinfo' ],
    \              [ 'filetype', 'cutfromright' ] ]
    \ },
    \ 'component': {
    \	'absolutepath' : '%.20F',
    \	'cutfromright': '%<',
    \	'lineinfo' : '%l:%L'
    \ },
    \ 'inactive': {
    \	'left': [ [ 'filename' ] ],
    \	'right': [ ['filetype', 'lineinfo' ] ]
    \ },
    \ 'tabline': {
    \	 'left': [ [ 'tabs' ] ],
    \	 'right': [ [ 'close' ] ] 
    \ },
    \ }
"
" Settings
set laststatus=2  " show bar
set noshowmode	" not show current mode
"
" }}} 

" ■ COMMENTARY.VIM plugin {{{
Plug 'tpope/vim-commentary'
autocmd FileType octave setlocal commentstring=#\ %s
autocmd FileType tex setlocal commentstring=%\ %s
" }}}

" ■ VIM MULTIPLE CURSOR plugin {{{
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" }}}

" ■ VIM SUBMODE plugin {{{
Plug 'kana/vim-submode', {'branch': 'master'}
" }}}

" ■ FERN plugin {{{
Plug 'lambdalisue/fern.vim', {'branch': 'master'}
" ■ FERN PLUGIN SETTINGS
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1
"
let g:fern#drawer_width = 30
let g:fern#default_hidden = 0
let g:fern#disable_drawer_smart_quit = 1

function! FernInit() abort
  nmap <buffer><nowait> l <Plug>(fern-action-open-or-expand)
  nmap <buffer><nowait> h <Plug>(fern-action-leave)
  nmap <buffer><nowait> <CR> <Plug>(fern-action-enter)

  nmap <buffer> H <Plug>(fern-action-open:split)
  nmap <buffer> V <Plug>(fern-action-open:vsplit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)

  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> M <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> N <Plug>(fern-action-new-path)

  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> h <Plug>(fern-action-hidden:toggle)
  nmap <buffer> mm <Plug>(fern-action-mark:toggle)

  nmap <buffer> S <Plug>(fern-action-open:select)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" }}}

call plug#end()
"
" }}}
"
" ▲ SUBMODE plugin settings {{{
"
" ■ Window mode {{{
" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1
let g:submode_timeout = 0
" We're taking over the default <C-w> setting. Don't worry we'll do
" our best to put back the default functionality.
call submode#enter_with('WindowsMode', 'n', '', '<Leader>w', ':echo "WindowsMode"<CR>')
call submode#leave_with('WindowsMode', 'n', '', '<Leader>')
" Maps
call submode#map('WindowsMode', 'n', '', 'c', '<C-w>c')
call submode#map('WindowsMode', 'n', '', 'o', '<C-w>o')
call submode#map('WindowsMode', 'n', '', 's', '<C-w>s')
call submode#map('WindowsMode', 'n', '', 'v', '<C-w>v')
call submode#map('WindowsMode', 'n', '', 'w', '<C-w>w')
"
call submode#map('WindowsMode', 'n', '', 'h', '<C-w>h')
call submode#map('WindowsMode', 'n', '', 'j', '<C-w>j')
call submode#map('WindowsMode', 'n', '', 'k', '<C-w>k')
call submode#map('WindowsMode', 'n', '', 'l', '<C-w>l')
"
call submode#map('WindowsMode', 'n', '', 'H', '<C-w>H')
call submode#map('WindowsMode', 'n', '', 'J', '<C-w>J')
call submode#map('WindowsMode', 'n', '', 'K', '<C-w>K')
call submode#map('WindowsMode', 'n', '', 'L', '<C-w>L')
"
" Go through symbols. Sadly, '|', not supported in submode plugin.
call submode#map('WindowsMode', 'n', '', '=', '<C-w>=')
call submode#map('WindowsMode', 'n', '', '_', '<C-w>_')
call submode#map('WindowsMode', 'n', '', '+', ':resize +5<CR>')
call submode#map('WindowsMode', 'n', '', '-', ':resize -5<CR>')
call submode#map('WindowsMode', 'n', '', '>', ':vertical resize +10<CR>')
call submode#map('WindowsMode', 'n', '', '<', ':vertical resize -10<CR>')
" }}}
"
" }}}
 
" ▲ OCTAVE SYNTAX {{{
augroup filetypedetect
au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
" }}}

" ▲ SET FORWARD LATEX SEARCH {{{
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
" }}}

" ▲ COLORSCHEME {{{
" nord
colorscheme nord
" }}}

" ▲ MACRO {{{
" Macro che automatizza l'editing del file della musica
let @m = '$F-dt.j'
" }}}
