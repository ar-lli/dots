" Set local settings for tex files
let b:did_ftplugin = 1
" GENERAL
setlocal cursorline
setlocal nocursorcolumn

" COMPLETION
setlocal complete-=i
setlocal completeopt=longest,menuone

" INDENTATION
setlocal tabstop=2 
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal noexpandtab

" SPELLING
setlocal spell spelllang=en,it "highlight spelling mistakes
