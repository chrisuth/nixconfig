" golang specific settings.
"

setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" Automatically format Go code on save
autocmd BufWritePre *.go Fmt

