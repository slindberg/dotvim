set ls=2                        " allways show status line
set number                      " show line numbers
set ruler                       " show line current line number/column
set showmatch                   " show matching brackets/braces/parantheses
set showcmd                     " display incomplete commands
set ttyfast                     " smoother changes
set tabstop=2                   " numbers of spaces of tab character
set shiftwidth=2                " numbers of spaces to (auto)indent
set autoindent                  " auto indentation
set expandtab                   " use spaces instead of evil tabs
set smartindent                 " like above but more generic
set whichwrap=b,s,h,l,<,>,[,]   " move freely between lines using these commands
set nowrap                      " don't wrap lines that are longer than the terminal width
set incsearch                   " search incrementally
set hlsearch                    " highlight search results
set ignorecase                  " when searching, ignore case
set smartcase                   " only ignore case (above) if the search is all lowercase
set autowriteall                " automatically save files after most commands
filetype on                     " filetype detection on
filetype plugin on              " load plugins
syntax on                       " use syntax highlighting

" choose a colorscheme
colorscheme ir_black

" change the leader key to the much quicker-to-type comma
let mapleader=","

" get rid of annoying shift key blunders
com W w
com Wq wq
com Q q

" Ex mode is dumb
map Q <nop>

" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> <c-w>k
nmap <silent> <c-j> <c-w>j
nmap <silent> <c-h> <c-w>h
nmap <silent> <c-l> <c-w>l
nmap <silent> <c-c> <c-w>c

" center on what we are looking for
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz

" remove search highlight with double escape
map <silent> <esc><esc> :nohlsearch<cr>

" initialize pathogen
call pathogen#infect()

if has("autocmd")
  " file type associations
  autocmd BufNewFile,BufRead *.less set filetype=less

  " tab settings
  autocmd FileType php setl
    \ noexpandtab
    \ tabstop=4
    \ shiftwidth=4

  " remove all trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " save files when focus is lost
  autocmd FocusLost * :wa | doautocmd BufWritePre

  " plugins are loaded after .vimrc is processed
  autocmd VimEnter * call Plugins()
endif

" plugin specific settings
function! Plugins()
  " NERDTree alias
  if exists(":NERDTree")
    " toggle NERDTree
    nmap <silent> <leader>n :NERDTreeTabsToggle<cr>

    " quit if NERDTree window is the last window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  endif

  " TComment alias
  if exists(":TComment")
    " toggle commenting on the line
    map <silent> <leader>/ :TComment<cr>
  endif
endfunction
