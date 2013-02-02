set ls=2                        " always show status line
set number                      " show line numbers
set ruler                       " show line current line number/column
set showmatch                   " show matching brackets/braces/parentheses
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
set spell spelllang=en_us       " highlight spelling mistakes
set listchars=tab:▸\ ,eol:¬     " use the same symbols for tabs and eol as textmate
set background=dark             " always try to use a dark background
filetype on                     " filetype detection on
filetype plugin on              " load plugins
syntax on                       " use syntax highlighting

" change the leader key to the much quicker-to-type comma
let mapleader=","

" get rid of annoying shift key blunders
com! W w
com! Wq wq
com! Q q

" write a file you opened without correct permissions
com! WW :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Ex mode is dumb
map Q <nop>

" remove search highlight with double escape
map <silent> <esc><esc> :nohlsearch<cr>

" use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> <c-w>k
nmap <silent> <c-j> <c-w>j
nmap <silent> <c-h> <c-w>h
nmap <silent> <c-l> <c-w>l
nmap <silent> <c-c> <c-w>c

" shortcut to switch to last used buffer
nnoremap <leader>l :e#<cr>

" center on what we are looking for
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz

" insert a blank line below the current line without entering insert mode
nnoremap <c-o> m`o<esc>``

" set paste mode and enter insert mode
nnoremap <silent> <leader>p :set paste!<cr>i
nnoremap <silent> <leader>pp :set nopaste<cr>

" reload vimrc
nnoremap <leader>rr :source $MYVIMRC<cr>

" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('active')

" set colorscheme when in terminal
if !has("gui_running")
  colorscheme solarized
endif

if has("autocmd")
  " highlight the line the cursor is on in the focused window
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline

  " plugins are loaded after .vimrc is processed
  autocmd VimEnter * call Plugins()
endif

" plugin specific settings
function! Plugins()
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
endfunction
