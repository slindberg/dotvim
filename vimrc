" general settings
source ~/.vim/config/settings.vim

" commands/mappings
source ~/.vim/config/bindings.vim

" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('active')

" set colorscheme when in terminal
if !has("gui_running")
  colorscheme solarized
endif

if has("autocmd")
  " auto commands
  source ~/.vim/config/autocmds.vim

  " load plugin config after .vimrc is processed
  autocmd VimEnter * source ~/.vim/config/plugins.vim
endif
