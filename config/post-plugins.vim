" NERDTree
if exists("loaded_nerd_tree")
  " toggle NERDTree, using TabsToggle
  nmap <silent> <leader>n :NERDTreeTabsToggle<cr>

  " locate the current buffer in the tree
  nmap <silent> <leader>f :NERDTreeFind<cr>

  " quit if NERDTree window is the last window open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" Syntastic
if exists("loaded_syntastic_plugin")
  " manually perform syntax check (the file must be saved in order to check)
  nmap <leader>c :w<cr>:SyntasticCheck<cr>

  " remove all error symbols in the signs column
  nmap <leader>C :SyntasticReset<cr>
endif

" Command-T
if has("gui_running") && exists("command_t_loaded")
  " ignore common non-project related directories
  set wildignore=.git,node_modules/**,out/**,dist/**,build/**

  " remap new tab to open command-t window afterwards
  map <d-t> :tabnew\|:CommandT<cr>
  imap <d-t> <esc>:tabnew\|:CommandT<cr>

  " remap open file to command-t
  map <d-o> :CommandT<cr>
  imap <d-o> <esc>:CommandT<cr>

  " shortcut for flushing the cache
  nmap <leader>u :CommandTFlush<cr>
endif

" Ack
if exists("ackprg")
  " shorthand command for acking
  cabbrev A Ack!

  " ack for the visually selected text
  vmap <leader>a y:<c-u>Ack! <c-r>0<cr>

  " ack from the last search
  nmap <leader>a :AckFromSearch!<cr>
endif

" tComment
if exists("loaded_tcomment")
  " toggle commenting on the line
  vmap <silent> <leader>/ :TComment<cr>
  nmap <silent> <leader>/ :TComment<cr>^j
endif

" FixWhitespace
if exists(":FixWhitespace")
  " shortcut for fixing whitespace manually
  nmap <leader>w :FixWhitespace<cr>

  " remove all trailing whitespace on save
  " autocmd BufWritePre * :FixWhitespace
endif

" Sideways
if exists("loaded_sideways")
  " shift parameters left or right
  nnoremap <silent> <leader>s :SidewaysRight<cr>
  nnoremap <silent> <leader>S :SidewaysLeft<cr>
endif

" Tabular
if exists("tabular_loaded")
  " shortcuts for common alignments
  nmap <leader>t= :Tabularize /=<cr>
  vmap <leader>t= :Tabularize /=<cr>
  nmap <leader>t: :Tabularize /:<cr>
  vmap <leader>t: :Tabularize /:<cr>
endif

" Supertab + DelimitMate
if exists("loaded_supertab") && exists("loaded_delimitMate")
  " if both supertab and delimitmate are loaded, combine their cr mappings
  imap <expr> <cr> pumvisible() ? '<c-y>' : '<plug>delimitMateCR'
endif

" HiCursorWords
if exists("HiCursorWords_delay")
  highlight! WordUnderTheCursor gui=bold, guifg=#E428A6
endif

" Operator-Camelize
if exists('loaded_operator_camelize')
  " mapping for camelizing/decamelizing ('h' for Hump?)
  map <leader>h <plug>(operator-camelize-toggle)
endif

" Fugitive
if exists('g:loaded_fugitive')
  nmap <leader>gs :Gstatus<cr>
endif
