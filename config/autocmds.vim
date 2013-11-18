" highlight the line the cursor is on in the focused window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" switch to command mode when focus is lost
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")
