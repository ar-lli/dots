" Set local settings for tex files
" Disable global ftplugin options:
let b:did_indent = 1
" GENERAL
setlocal cursorline
setlocal nocursorcolumn

" INDENTATION
setlocal indentexpr=	"Elimina ogni tipo di indentazione
setlocal noautoindent
setlocal nosmartindent
setlocal tabstop=8 
setlocal softtabstop=4 
setlocal shiftwidth=4 
setlocal noexpandtab
setlocal breakindent

" COMPLETION
setlocal complete-=i
setlocal completeopt=longest,menuone

" SPELLING
setlocal spell spelllang=en,it "highlight spelling mistakes





