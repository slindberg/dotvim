" General
filetype plugin on              " detect file types and use plugins
syntax on                       " use syntax highlighting
set directory=~/.vim/tmp//,.    " directory for swap files
set undodir=~/.vim/undo         " directory for persistent undo history

" UI
set title                       " set the title of the window to the file name
set laststatus=2                " always show status line
set wildmenu                    " show auto-completion options above status line
set number                      " show line numbers
set ruler                       " show line current line number/column
set nowrap                      " don't wrap lines that are longer than the terminal width
set showcmd                     " display incomplete commands
set ttyfast                     " smoother changes

" Behavior
set whichwrap=b,s,h,l,<,>,[,]   " move freely between lines using these commands
set autoread                    " automatically reload changes to files
set autowriteall                " automatically save files after most commands
set undofile                    " keep a history of changes to enable undo between sessions
set spell spelllang=en_us       " highlight spelling mistakes
set showmatch                   " show matching brackets/braces/parentheses
set nofoldenable                " disable code folding
set nostartofline               " don't move cursor do the start of the line after scrolling

" Indentation
set tabstop=2                   " numbers of spaces of tab character
set shiftwidth=2                " numbers of spaces to (auto)indent
set expandtab                   " use spaces instead of evil tabs
set smartindent                 " like above but more generic
set autoindent                  " auto indentation

" Search
set incsearch                   " search incrementally
set hlsearch                    " highlight search results
set ignorecase                  " when searching, ignore case
set smartcase                   " only ignore case (above) if the search is all lowercase

" Visual
set background=dark             " always try to use a dark background
set list                        " show invisible character
set listchars=tab:▸\            " show special character for tabs
set listchars+=extends:>        " indicate there is non-wrapped text beyond the screen
set listchars+=precedes:<       " same as above but for text to the left
