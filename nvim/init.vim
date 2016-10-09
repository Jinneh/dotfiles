
set runtimepath^=$XDG_CACHE_HOME/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('<sfile>'))

	call dein#begin(expand($XDG_CACHE_HOME.'/nvim/dein'))
	call dein#add('Shougo/dein.vim')

	"Colorschemes
	call dein#add('altercation/vim-colors-solarized')


	" File Managing
	call dein#add('christoomey/vim-tmux-navigator')
	call dein#add('Shougo/denite.nvim')
	

	" Interface
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('nathanaelkane/vim-indent-guides')
	"call dein#add('ryanoasis/vim-devicons')


	" Libs
	call dein#add('Shougo/neco-vim',          { 'on_ft': ['vim'] })
	call dein#add('Shougo/neoinclude.vim',    { 'on_ft': ['vim'] })
	call dein#add('kchmck/vim-coffee-script', { 'on_ft': ['coffee'] })
	call dein#add('carlitux/deoplete-ternjs', { 'on_ft': ['javascript'], 'if': 0 })
	"call dein#add('zchee/deoplete-clang',     { 'on_ft': ['c', 'cpp'] })
	call dein#add('osyo-manga/vim-monster',   { 'on_ft': ['ruby'] })
	call dein#add('artur-shaik/vim-javacomplete2', { 'on_ft': ['java'] })


	" Helper
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-dispatch')
	call dein#add('benekastah/neomake')
	call dein#add('Konfekt/FastFold')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
	call dein#add('godlygeek/tabular')


	" Formatter
	call dein#add('rhysd/vim-clang-format', { 'on_ft': ['c', 'cpp'] })

	
	" Snippets
	call dein#add('SirVer/ultisnips')
	call dein#add('honza/vim-snippets')


	call dein#add('tpope/vim-rails', { 'on_ft': ['ruby'] })
	

	" Syntax
	call dein#add('justinmk/vim-syntax-extra')              " C / C++
	call dein#add('othree/javascript-libraries-syntax.vim') " Java- / Coffescript
	call dein#add('hail2u/vim-css3-syntax')                 " css
	call dein#add('tmux-plugins/vim-tmux')                  " tmux.conf
	call dein#add('cespare/vim-toml')                       " toml
	call dein#add('plasticboy/vim-markdown')                " Markdown
	call dein#add('leafgarland/typescript-vim')             " Typescript


	call dein#end()
	call dein#save_state()
endif


" -- Plugin Settings --

filetype plugin indent on


" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent><C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent><C-Down> :TmuxNavigateDown<cr>
nnoremap <silent><C-Up> :TmuxNavigateUp<cr>
nnoremap <silent><C-Right> :TmuxNavigateRight<cr>

" deoplete
"let g:deoplete#auto_complete_delay = 0
let g:deoplete#max_list = 20
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
"let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_completed_snippet = 1
let g:deoplete#auto_complete_start_length = 0
let g:deoplete#ignore_sources = {}
let b:deoplete_ignore_sources = ['buffer']


" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
let g:deoplete#sources#clang#std = { 'cpp': 'c++14', 'c': 'c14' }
"let g:deoplete#sources#clang#sort_algo = 'priority' " or 'alphabetic'
autocmd CompleteDone * pclose!

" vim-monster (Ruby)
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.ruby = [
			\'[^. *\t]\.\w*',
			\'[a-zA-Z_]\w*::'
			\]

" Javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_ClosingBrace = 1
let g:deoplete#ignore_sources.java = ['javacomplete2']

if 1
	let g:deoplete#ignore_sources.java = ['omni']
	call deoplete#custom#set('javacomplete2', 'mark', '')
else
	let g:deoplete#ignore_sources.java = ['javacomplete2']
	call deoplete#custom#set('omni', 'mark', '')
endif


let g:deoplete#omni#input_patterns.java = [
			\'[^. \t0-9]\.\w*',
			\'[^. \t0-9]\->\w*',
			\'[^. \t0-9]\::\w*',
			\]


" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F'
"let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif


" ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"


" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 0

" FastFold
let g:tex_fold_enable=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding=1
let g:php_folding=1

" neomake
let g:neomake_open_list = 2
let g:neomake_warning_sign = {
			\ 'text': 'ω',
			\ 'texthl': 'WarningMsg',
			\ }
let g:neomake_error_sign = {
			\ 'text': '∃',
			\ 'texthl': 'ErrorMsg',
			\ }

" solarized
let g:solarized_visibility = "low"


" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction



" -- Global Settings --

colorscheme solarized
set background=light
syntax on

"set encoding=utf-8
"set foldmethod=indent
"set foldlevel=0
"set foldnestmax=1
"set nofoldenable
set cursorline
"set cursorcolumn
"set lazyredraw
set number
set relativenumber
set timeoutlen=150
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set expandtab
"set smarttab
"set shiftround
set ruler
set showmatch
set hidden
set history=100
set scrolloff=5
set sidescroll=8

set ignorecase
set smartcase
set incsearch
"set nohlsearch
set pastetoggle=<F10>

set listchars=tab:▸\ ,eol:¬,precedes:<,extends:>
"set list

set title
set laststatus=2
set mouse=n

set wildmode=longest,list,full
set wildmenu
set completeopt+=noselect
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=tags,*.tags
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.out,*.class,*.jpg,*jpeg,*.bmp,*.gif,*.png
set wildignore+=*.swp,*.swo,*.swn


let g:tex_flavor = 'tex' " disable plaintex



" -- Commands --

command W w !sudo tee % > /dev/null



" -- Mapping --

inoremap <F5> <ESC> :Dispatch<Return>a
noremap <F5> :Dispatch<esc>


"nnoremap q <Nop>

nnoremap <silent><Down> gj
inoremap <silent><Down> <C-o>gj
nnoremap <silent><Up> gk
inoremap <silent><Up> <C-o>gk

nnoremap <silent><HOME> ^
inoremap <silent><HOME> <C-o>^

nnoremap <silent><END> $
inoremap <silent><END> <C-o>$


nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap <silent> <C-l> :nohl<CR><C-l>

nnoremap <silent><S-Left> <C-w>>
nnoremap <silent><S-Down> <C-w>-
nnoremap <silent><S-Up>   <C-w>+
nnoremap <silent><S-Right> <C-w><
