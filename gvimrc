" set font and size
set guifont=Menlo:h15

" Smyck colorscheme looks better in vim GUI
colorscheme smyck

" automatically reload a file if it has changed outside of vim
set autoread

" disable audible bell, visual bell doesn't work in MacVim
set visualbell

" save files when focus is lost
autocmd FocusLost * :wa | doautocmd BufWritePre

if has("gui_macvim")
  " unbind MacVim's new tab key so that the key can be remapped
  " NOTE: this is ineffective if placed in .vimrc
  macmenu &File.New\ Tab key=<nop>
  macmenu &File.Open\.\.\. key=<nop>
endif

" set custom tab label that displays the immediate directory name
function GuiTabLabel()
  let label = ''

  " Add '+' if one of the buffers in the tab page is modified
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Add file name with immediate directory
  let bufferId = bufnrlist[tabpagewinnr(v:lnum) - 1]
  let fileName = bufname(bufferId)
  let lastSlashIndex = strridx(fileName, '/')
  if (lastSlashIndex != -1)
    let lastSlashIndex = strridx(fileName, '/', lastSlashIndex - 1)
  endif

  return label . strpart(fileName, lastSlashIndex + 1, strlen(fileName))
endfunction
set guitablabel=%{GuiTabLabel()}
