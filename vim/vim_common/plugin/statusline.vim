let g:statusline_max_path = 20

fun! StatusLineGetPath() "{{{
  let p = expand('%:.:h') "relative to current path, and head path only
  let p = substitute(p,'\','/','g')
  let p = substitute(p, '^\V' . $HOME, '~', '')
  if len(p) > g:statusline_max_path 
    let p = simplify(p)
    let p = pathshorten(p)
  endif
  return p
endfunction "}}}

nmap <Plug>view:switch_status_path_length :let g:statusline_max_path = 200 - g:statusline_max_path<cr>
nmap ,t <Plug>view:switch_status_path_length



set laststatus=2

augroup Statusline
  au! Statusline

  au BufEnter * call <SID>SetFullStatusline()
  au BufLeave,BufNew,BufRead,BufNewFile * call <SID>SetSimpleStatusline()
augroup END

fun! StatusLineRealSyn()
    let synId = synID(line('.'),col('.'),1)
    let realSynId = synIDtrans(synId)
    if synId == realSynId
        return 'Normal'
    else
        return synIDattr( realSynId, 'name' )
    endif
endfunction

" from buftabs plugin
function! Buftabs_show()

	let l:i = 1
	let l:count = 1
	let l:list = ''
	let l:start = 0
	let l:end = 0
	if ! exists("s:from") 
		let s:from = 0
	endif

	" Walk the list of buffers

	while(l:i <= bufnr('$'))

		" Only show buffers in the list, and omit help screens
	
		if buflisted(l:i) && getbufvar(l:i, "&modifiable") 

			" Append the current buffer number and name to the list. If the buffer
			" is the active buffer, it is enclosed in square brackets. If it is
			" modified, it is appended with an exclaimation mark

			if bufwinnr(l:i) != -1
				let l:list = l:list . '['
				let l:start = strlen(l:list)
			else
				let l:list = l:list . ' '
			endif
				
			let l:list = l:list . l:count . "-" 

			if exists("g:buftabs_only_basename")
				let l:list = l:list . fnamemodify(bufname(l:i), ":t")
			else
				let l:list = l:list . fnamemodify(bufname(l:i), ":~:.")
			endif

			if getbufvar(l:i, "&modified") == 1
				let l:list = l:list . "!"
			endif
			
			if bufwinnr(l:i) != -1
				let l:list = l:list . ']'
				let l:end = strlen(l:list)
			else
				let l:list = l:list . ' '
			endif

			let l:count = l:count + 1
		end

		let l:i = l:i + 1
	endwhile

	" If the resulting list is too long to fit on the screen, chop
	" out the appropriate part

	let l:width = winwidth(0) - 12

	if(l:start < s:from) 
		let s:from = l:start - 1
	endif
	if l:end > s:from + l:width
		let s:from = l:end - l:width 
	endif
		
	let l:list = strpart(l:list, s:from, l:width)

    return l:list

endfunction


fun! s:SetFullStatusline() "{{{
  setlocal statusline=
  "setlocal statusline+=%#StatuslineBufNr#%-1.2n\                   " buffer number
  "setlocal statusline+=%#StatuslinePath#\ %-0.20{StatusLineGetPath()}%0* " path
  "setlocal statusline+=%#StatuslineFileName#\/%t\                       " file name
  "setlocal statusline+=%#StatuslineFileName#\ [%t]\                       " file name
  setlocal statusline+=%#StatuslineFileName#\ %{Buftabs_show()}\                       " file name

  setlocal statusline+=%h%#StatuslineFlag#%m%r%w                 " flags
  setlocal statusline+=%#StatuslinePath#\ %{StatusLineGetPath()}\       " path

  " 上面靠左对齐
  setlocal statusline+=%#StatusLineChar#
  setlocal statusline+=%=
  " 下面靠右对齐

  "setlocal statusline+=%#StatuslineChar#\ char(%-2B)\ %0*                 " current char
  "setlocal statusline+=%#StatuslineSyn#\ %{synIDattr(synID(line('.'),col('.'),1),'name')}\ %0*           "syntax name
  "setlocal statusline+=%#StatuslineRealSyn#\ %{StatusLineRealSyn()}\ %0*           "real syntax name

  setlocal statusline+=%#StatuslineFileType#\ %{strlen(&ft)?&ft:'**'}  " filetype
  setlocal statusline+=%#StatuslineFileEnc#\ %{&fileencoding}\         " file encoding
  setlocal statusline+=%#StatuslineFileType#%{&fileformat}\             " file format
  "setlocal statusline+=%#StatuslineTermEnc#\ %{&termencoding}\           " encoding
 
  "setlocal statusline+=\ %-10.(%l,%c-%v%)             "position
  setlocal statusline+=%#StatuslineSomething#%l,%c             "position
  "setlocal statusline+=%P                             "position percentage
  setlocal statusline+=\ %#StatuslineTime#%{strftime(\"%m-%d\ %H:%M\")} " current time

endfunction "}}}

fun! s:SetSimpleStatusline() "{{{
  setlocal statusline=
  setlocal statusline+=%#StatuslineNC#%-0.20{StatusLineGetPath()}%0* " path
  setlocal statusline+=\/%t\                       " file name
endfunction "}}}

