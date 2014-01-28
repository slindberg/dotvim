" highlight the line the cursor is on in the focused window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" switch to command mode when focus is lost
autocmd FocusLost,TabLeave * call feedkeys("\<c-\>\<c-n>")

" override sign column's background color to always be the same as the normal background
let term_type = has("gui_running") ? 'gui' : 'cterm'
autocmd ColorScheme * execute 'execute "highlight SignColumn" .' .
      \' " ' . term_type . 'bg=" . synIDattr(synIDtrans(hlID("Normal")), "bg", "' . term_type . '")'

" define the dummy sign (this only needs to happen once)
sign define dummy

" add a 'dummy' sign to every buffer to force sign column to always show
function AddDummySign()
  " don't add a sign to the NERDTree buffer
  if bufname('%') !~ '^NERD'
    " Use ID 9999 so as not to conflict with other signs
    execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('%')
  endif
endfunction
autocmd BufEnter * call AddDummySign()
