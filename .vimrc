set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CycleColor'
Plugin 'tpope/vim-obsession'
Plugin 'The-NERD-tree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'surround.vim'
Plugin 'commentary.vim'
Plugin 'vim-indent-object'
Plugin 'Tagbar'
Plugin 'vimwiki'
Plugin 'fugitive.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" VUNDLE ENDS "

let mapleader = "\<Space>"

set hidden
set tabstop=4
set shiftwidth=4
set nu
set rnu
set showmode
set showcmd
set hlsearch
set incsearch
set ruler
set complete+=kspell
set dictionary=/usr/share/dict/words

set splitbelow splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


syntax on
" toggles paste for sane copying with syntax on
set pastetoggle=<F3>
" Pre-given folds started to be Disturbing, ruled out!
"set foldmethod=syntax

" {{{ TAGS
	" ^] to dive deeper!
	" ^t to rise up!
	command! MakeTags !ctags -R .
" }}}

" AUTOCOMPLETE:
" doc in |ins-completion|
"
" HIGHLIGHTS:
" ^x^n for JUST this file
" ^x^f for filenames ONLY
" ^x^] for tags only
" ^n or ^p changes the pop-up's order
" ~AUTOCOMPLETE

" {{{ SNIPPETS
	" {{{ C
		nnoremap <leader>cmain :-1read /home/demirel/.vim/.cfolder/.skeleton.main.c<CR>5ji
		nnoremap <leader>cdocu :read /home/demirel/.vim/.cfolder/.documentation.header.c<CR>jA
	" }}}

	" {{{ Python
		nnoremap <leader>pygs :exe "norm \"fyiw" <bar> exe "normal }" <bar> exe "read ~/.vim/.pythonfolder/.getter_setter.py" <bar> exe "normal V14jV" <bar> exe "'<,'>s/x/".@f."/g"<CR><CR>
	" }}}
" }}}


" {{{ TABS ^
	nnoremap tn :tabnew<Space>
	nnoremap tm :tabmove<Space>

	nnoremap tk :tabnext<CR>
	nnoremap tj :tabprev<CR>

	nnoremap th :tabfirst<CR>
	nnoremap tl :tablast<CR>
	nnoremap tc :tabclose<CR>

	nnoremap <leader>1 1gt
	nnoremap <leader>2 2gt
	nnoremap <leader>3 3gt
	nnoremap <leader>4 4gt
	nnoremap <leader>5 5gt
" }}}


" {{{ Aliases
	" save all buffers in current tab!
	" nnoremap <leader>w :windo w<CR> " Changed after vimwiki
	nnoremap <leader>G :Gstatus<CR>
	inoremap aa <ESC>
	"inoremap <C-]> <C-X><C-]> " completion mappings
	"inoremap <C-l> <C-X><C-l>
	"inoremap <C-k> <C-X><C-k>
" }}}

" {{{ Pre-Load Regs ^

" Print Macro
let @p='diWiprintf()€kl""€kl:p€@7a;'

" }}}

" {{{ From Stefan
	set listchars=tab:»\ ,trail:·
	set list

	set history=700
	set undolevels=700
	set nosmartindent
	set autoindent

	au BufRead,BufNewFile
	\ *.c,*.h,*.cpp,*.hpp,*.cxx,*.hxx,*.cpn,*.pl,*.sh,*.tcl,*.tex,*.bib,*.java,*.xml,*.xslt,*.xsl,*.sg,*.html,*.htm,*.js,*.php,*.py,*.scad,*.md
	\ set tabstop=2 shiftwidth=2 autoindent noexpandtab
	" noexpandtab is NEEDED for trailing tabs

	set noexpandtab
	set nowrap
	set sidescroll=10
	"'sidescroll' 'ss'	number	(default 0)
	"			global
	"			{not in Vi}
	"	The minimal number of columns to scroll horizontally.  Used only when
	"	the 'wrap' option is off and the cursor is moved off of the screen.
	"	When it is zero the cursor will be put in the middle of the screen.
	"	When using a slow terminal set it to a large number or 0.  When using
	"	a fast terminal use a small number or 1.  Not used for "zh" and "zl"
	"	commands.
	"
" }}}

" {{{ vim as a Python IDE ^
	set clipboard=unnamed
" }}}

" NERDTree {{{
    " Toggle NERDTree
    nmap <silent> <leader>k :NERDTreeToggle<cr>
    " find the current file in nerdtree without needing to reload the drawer
    nmap <silent> <leader>y :NERDTreeFind<cr>
    nmap <silent> <leader>f :NERDTreeFocus<cr>

    let NERDTreeShowHidden=1
    let NERDTreeWinSize = 40
    let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "¿",
    \ "Staged"    : "¿",
    \ "Untracked" : "¿",
    \ "Renamed"   : "¿",
    \ "Unmerged"  : "¿",
    \ "Deleted"   : "¿",
    \ "Dirty"     : "¿",
    \ "Clean"     : "¿¿",
    \ 'Ignored'   : '¿',
    \ "Unknown"   : "?"
    \ }
" }}}


" {{{ VISUALS

	" {{{ tmux
		set background=dark
		set t_Co=256
		set term=screen-256color
	" }}}
	
	highlight ColorColumn ctermbg=gray
	"set colorcolumn=80

	colorscheme Tomorrow-Night
	" Some cool colorschemes
	"
	" matrix > default
	" molokai
	" candycode 
	" jellyx
	" railscasts
	" 1989
	" Tomorrow-Night
	" Tomorrow-Night-Eighties
	" PaperColor
	" radicalgoodspeed
	" evening
	" morning
	" shine
	" antares !
	" behelit
	" codeschool
	" detailed
	" kalt
	" donbass
	" distinguished
" }}}



" {{{ Fuzzy File Find
	" Do not know the reason exactly :D
	filetype plugin on

	" Display all matching when tab complete
	set wildmenu
	" To enable find act like **fuzzy file find**
	set path+=**
	" you can also use :b and search for a file infact open it.
" }}}

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Ln:\ %l\ \ Col:\ %c

function! HasPaste()
    if &paste
        return 'P ON  '
    endif
    return ''
endfunction

