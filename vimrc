
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader = ","
let g:mapleader = ","

"backup for no monaco font
"set guifont=Consolas:h14
"set guifont=Monaco:h12
set guifont=Envy\ Code\ R:h12

" highlight current line
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! <CR>

" mark current line
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" hide the gvim menu and toolbar
" set guioptions-=m
set guioptions-=T

" line number column width 
set numberwidth=4

" initialize width of window
set columns=135

" initialize hight of window
set lines=50

" Global Set
map <leader>e :e! ~/.vimrc<cr>
let g:Source="D:\\VimRoot"

function Cw(dir)
    execute ":cd " . a:dir
endfunction

" Open the g:Source folder when gvim start
call Cw(g:Source)
com -nargs=1 Chw call Cw()

" Collapse
set fdm=syntax

"base on the http://stackoverflow.com/questions/164847/what-is-in-your-vimrc

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?
set tabstop=4
set shiftwidth=4
set softtabstop=4

" english spelllchecking
if version >= 700
	set spl=en spell
	set nospell
endif

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Got backspace?
set backspace=2

" Line Numbers
set number

" Ignoring cases
set ignorecase

" And so is Artificial Intellegence
set smartcase

" Remap jj to escape in insert mode.
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch
set showcmd

" Encoding
"filetype on
"filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

colorscheme darkblue                   
set nobackup
set tags=./tags,tags;
set autochdir

:nmap <C-t> :tabnew<CR>      
:nmap <F5> :tabprevious<CR>   
:nmap <F6> :tabnext<CR>        

" CTags
let Tlist_Ctags_Cmd = 'C:\ctags58\ctags'    
let Tlist_Show_One_File = 1      
let Tlist_Exit_OnlyWindow = 1    
let Tlist_Use_Right_Window = 1

" Taglist
:command T TlistToggle
:nmap <silent> <F3> :T<CR>    

set diffexpr=MyDiff()
function MyDiff()
let opt = '-a ¨Cbinary '
if &diffopt =~ 'icase¡¯ | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite¡¯ | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let eq = "
if $VIMRUNTIME =~ ' '
if &sh =~ '\
let cmd = '""' . $VIMRUNTIME . '\diff"'
let eq = '"'
else
let cmd = substitute($VIMRUNTIME, ' ', '" ', ") . '\diff"'
endif
else
let cmd = $VIMRUNTIME . '\diff¡¯
endif
silent execute '!¡¯ . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"javascript fold
let b:javascript_fold=1

"NERD_commenter
let NERDShutUp=1
map <c-h> ,c<space>

:set selection=exclusive
:set virtualedit=

"netrw setting
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>

"Open current line uri in browser
function! Browser()
    let line0 = getline(".")
    :close
    :if "" == line
        let line = matchstr(line0, "ftp[^ ]*")
    :endif
    :if "" == line
        let line = matchstr(line0, "file[^ ]*")
    :endif
    let line = escape(line, "#?&;|%")

    exec ':silent !C:\Users\lshi\AppData\Local\Google\Chrome\Application\chrome.exe ' . line 

endfunction

map <Leader>b :call Browser ()<CR>

"Open current file in the browser
function BrowserFile()
    let l:fname = expand("%:p")
    exec ':silent !C:\Users\lshi\AppData\Local\Google\Chrome\Application\chrome.exe ' . l:fname 
endfunction

map <Leader>bf :call BrowserFile()<CR>

" wtf is this?
map <silent> <F4> :let @+=expand("%:p")<CR>

"VIMWiki Nested_Syntaxes
    let wiki = {}
    let wiki.path = '~/vimwiki'
    let wiki.nested_sytaxes = {'javascript' : 'javascript', 'csharp' : 'csharp'}
    let g:vimwiki_list = [wiki]

"No camel case for wiki item
let g:vimwiki_camel_case = 0

"Mark the item is done
let g:vimwiki_hl_cb_checked = 1

let g:vimwiki_folding = 1

let g:vimwiki_CJK_length = 1

map <F7> :Vimwiki2HTML<cr>

" JQuery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" javascript
let b:javascript_fold = 1 "open collaps
let javascript_enable_domhtmlcss = 1 "enable to dom html css hightlight support

" javascriptLint
map <F10> :call JavascriptLint()<cr>

" quickfix
map <leader>cw :cw<cr>

" tagbar
nmap <silent> <F2> :TagbarToggle<CR>
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_width = 30

" config XML
" base on http://www.pinkjuice.com/howto/vimxml/setup.xml

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Installed

" www.vim.org/scripts/script.php?script_id=301
" $ADDED/xml.vim

" www.vim.org/scripts/script.php?script_id=39
" copied macros/matchit.vim to plugin/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML

" Save Session
" set sessionoptions=buffers,curdir,resize,folds,tabpages
" autocmd VimLeave * mks! $HOME/vimfiles/session/Session.vim
" autocmd VimEnter * nested :call s:ReadSession()
" function s:ReadSession()
"     let session_file = $HOME . "/vimfiles/session/Session.vim"
"     if filereadable(session_file)
"         execute "so " . session_file
"     endif
" endfunction


" http://beiyuu.com/git-vim-tutorial/
" Config for Vundle

" Installation:
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" case-sensitive
" git clone --recursive 'https://github.com/vim-scripts/ctags.vim.git' '~/.vim/bundle/ctags.vim'

set nocompatible
filetype off    " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'AutoClose'
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'indent'
Bundle 'ZenCoding.vim'

filetype plugin indent on   " required
syntax on

"Workaround for the vundle under windows
set shellxquote=

" For NERD_tree
autocmd vimenter * NERDTree " if !argc() | NERDTree | endif
" autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
map <leader>nt :NERDTree<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$', '\~$']
let NERDTreeShowLineNumbers=1
"let NERDTreeWinPos=1

" test for syntax
au BufNewFile,BufRead *.sl set syntax=Lisp

" indent
let g:indent_guides_guide_size=1
