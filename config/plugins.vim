if exists("loaded_nerd_tree")
  " toggle NERDTree, using TabsToggle if possible
  if has("gui_running") && exists(":NERDTreeMirrorToggle")
    nmap <silent> <leader>n :NERDTreeTabsToggle<cr>
  else
    nmap <silent> <leader>n :NERDTreeToggle<cr>
  endif

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

  " disable bookmarks by specifying an invalid path
  let g:NERDTreeBookmarksFile = ''

  " quit if NERDTree window is the last window open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

if exists("loaded_syntastic_plugin")
  " change default symbol characters
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'

  " manually perform syntax check
  nmap <leader>c :SyntasticCheck<cr>

  " remove all error symbols in the signs column
  nmap <leader>C :sign unplace *<cr>

  " automatically jump to first error
  let g:syntastic_auto_jump=1

  " no syntax highlighting on html files
  let g:syntastic_mode_map = {
    \ 'mode'              : 'active',
    \ 'active_filetypes'  : [],
    \ 'passive_filetypes' : ['html']
  \ }
endif

if exists("command_t_loaded") && has("gui_running")
  " remap new tab to open command-t window afterwards
  map <d-t> :tabnew\|:CommandT<cr>
endif

if exists("loaded_tcomment")
  " toggle commenting on the line
  vmap <silent> <leader>/ :TComment<cr>
  nmap <silent> <leader>/ :TComment<cr>^j
endif

if exists("ackprg")
  " shorthand command for acking
  cabbrev A Ack!

  " ack for the visually selected text
  vmap <leader>a y:<c-u>Ack! <c-r>0<cr>

  " ack from the last search
  nmap <leader>a :AckFromSearch!<cr>
endif

if exists(":FixWhitespace")
  " shortcut for fixing whitespace manually
  nmap <leader>w :FixWhitespace<cr>

  " remove all trailing whitespace on save
  " autocmd BufWritePre * :FixWhitespace
endif

if exists("loaded_sideways")
  " shift parameters left or right
  nnoremap <silent> <leader>s :SidewaysRight<cr>
  nnoremap <silent> <leader>S :SidewaysLeft<cr>
endif

if exists("tabular_loaded")
  " shortcuts for common alignments
  nmap <leader>t= :Tabularize /=<cr>
  vmap <leader>t= :Tabularize /=<cr>
  nmap <leader>t: :Tabularize /:<cr>
  vmap <leader>t: :Tabularize /:<cr>
endif

if exists("loaded_delimitMate")
  " put matching cr on the next line
  let g:delimitMate_expand_cr = 1

  " add '<:>' to matched pairs when in html
  au FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

  " ignore double quotes in vim files since they start comments
  au FileType vim let b:delimitMate_quotes = "' `"

  " match asterisks in markdown files
  au FileType markdown let b:delimitMate_quotes = "\" ` *"

  " changing settings requires a reload
  :silent DelimitMateReload
endif

if exists("loaded_supertab") && exists("loaded_delimitMate")
  " if both supertab and delimitmate are loaded, combine their cr mappings
  imap <expr> <cr> pumvisible() ? '<c-y>' : '<plug>delimitMateCR'
endif
