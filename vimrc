" general settings
source ~/.vim/config/settings.vim

" commands/mappings
source ~/.vim/config/bindings.vim

" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('active')

" set colorscheme
source ~/.vim/config/colorscheme.vim

if has("autocmd")
  " auto commands
  source ~/.vim/config/autocmds.vim

  " load plugin config after .vimrc is processed
  autocmd VimEnter * source ~/.vim/config/plugins.vim
endif
