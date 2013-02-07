if exists(":NERDTree")
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

if exists(":SyntasticCheck")
  " manually perform syntax check
  nmap <leader>c :SyntasticCheck<cr>

  " automatically jump to first error
  let g:syntastic_auto_jump=1

  " no syntax highlighting on html files
  let g:syntastic_mode_map = {
    \ 'mode'              : 'active',
    \ 'active_filetypes'  : [],
    \ 'passive_filetypes' : ['html']
  \ }

endif

if exists(":CommandT")
  " remap new tab to open command-t window afterwards
  map <d-t> :tabnew\|:CommandT<cr>
endif

if exists(":TComment")
  " toggle commenting on the line
  map <silent> <leader>/ :TComment<cr>
endif

if exists(":Ack")
  " shorthand command for acking
  cabbrev A Ack!

  " ack for the visually selected text
  vmap <leader>a y:<c-u>Ack! <c-r>0<cr>

  " ack from the last search
  nmap <leader>a :AckFromSearch!<cr>
endif

if exists(":FixWhitespace")
  " remove all trailing whitespace on save
  autocmd BufWritePre * :FixWhitespace
endif

if exists(":SidewaysLeft")
  " shift parameters left or right
  nnoremap <silent> <leader>s :SidewaysRight<cr>
  nnoremap <silent> <leader>S :SidewaysLeft<cr>
endif

if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<cr>
  vmap <leader>t= :Tabularize /=<cr>
  nmap <leader>t: :Tabularize /:<cr>
  vmap <leader>t: :Tabularize /:<cr>
endif
