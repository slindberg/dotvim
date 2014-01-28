"
" NERDTree
"

" change the current directory when the root node changes
let g:NERDTreeChDirMode = 2

" don't show the 'Press ? for help' text
let g:NERDTreeMinimalUI = 1

" show hidden files by default
let g:NERDTreeShowHidden = 1

" but ignore the git dir
let g:NERDTreeIgnore = [ '\.git$' ]

" close invalid buffers automatically
let g:NERDTreeAutoDeleteBuffer = 1

"
" Syntastic
"

" automatically jump to first error
let g:syntastic_auto_jump = 1

" enabled active syntax checking
let g:syntastic_mode_map = {
  \ 'mode'              : 'active',
  \ 'active_filetypes'  : [],
  \ 'passive_filetypes' : []
\ }

" no HTML syntax checking in Handlebars templates
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }

" change default symbol characters
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

"
" DelimitMate
"

" put matching cr on the next line
let g:delimitMate_expand_cr = 1

" add '<:>' to matched pairs when in html
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" ignore double quotes in vim files since they start comments
autocmd FileType vim let b:delimitMate_quotes = "' `"

" match asterisks in markdown files
autocmd FileType markdown let b:delimitMate_quotes = "\" ` *"

"
" UltiSnips
"

" use the tab key for everything
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" don't use the default snippets
let g:UltiSnipsSnippetDirectories = ["snippets"]

"
" HiCursorWords
"

" highlight specific JS groups as well
let g:highlightGroups = [
  \ 'Identifier',
  \ 'Special',
  \ 'jsBlock',
  \ 'jsBracket',
  \ 'jsObjectKey',
  \ 'jsFunctionKey',
  \ 'jsFuncBlock',
  \ 'jsFuncCall',
  \ 'jsFuncArgs',
  \ 'jsParen'
\ ]

let g:HiCursorWords_hiGroupRegexp = '\(' . join(g:highlightGroups, '\|') . '\)'

"
" Airline
"

" use patched fonts, but only with GUI-vim
if has("gui_running")
  let g:airline_powerline_fonts = 1
endif

"
" Git Gutter
"

" disable git gutter in terminal, it causes wacky shit to happen
if !has("gui_running")
  let g:gitgutter_enabled = 0
endif
