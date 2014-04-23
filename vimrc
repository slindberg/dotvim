" general settings
source ~/.vim/config/settings.vim

" commands/mappings
source ~/.vim/config/mappings.vim

" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect('active/{}')

" auto commands
source ~/.vim/config/autocmds.vim

" configure plugins
source ~/.vim/config/pre-plugins.vim

" run post-init plugin configuration after .vimrc is processed
autocmd VimEnter * source ~/.vim/config/post-plugins.vim

" set colorscheme
source ~/.vim/config/colorscheme.vim
