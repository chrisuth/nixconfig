" python specific settings.
"

" python-mode plugin
" -------------------------------------------------------------
" YouCompleteMe is better
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_cwindow = 1
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_unmodified = 1
nmap <Leader>sc :PymodeLint<CR>

" auto format code
nmap <Leader>ff :PymodeLintAuto<CR>

let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" -------------------------------------------------------------
