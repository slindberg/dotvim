if exists(":NERDTree")
  " toggle NERDTree, using TabsToggle if possible
  if has("gui_running") && exists(":NERDTreeTabsToggle")
    nmap <silent> <leader>n :NERDTreeTabsToggle<cr>
  else
    nmap <silent> <leader>n :NERDTreeToggle<cr>
  endif

  " change the current directory when the root node changes
  let g:NERDTreeChDirMode = 2

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
  cabbrev A Ack
endif

if exists(":FixWhitespace")
  " remove all trailing whitespace on save
  autocmd BufWritePre * :FixWhitespace
endif
