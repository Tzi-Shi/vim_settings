 " basic 
set wildmode=longest,list
set whichwrap+=<,>,h,l,[,]
set wildmenu
set splitright
set splitbelow
set completeopt=menu
set vb
set autoindent
set cindent
set nowrap
set softtabstop=4 expandtab
set shiftwidth=4
set expandtab
set number relativenumber
set signcolumn=yes
set switchbuf=vsplit
set hlsearch
set mouse=a

nmap <silent> <A-Up> :wincmd k <CR>
nmap <silent> <A-Down> :wincmd j <CR>
nmap <silent> <A-Left> :wincmd h <CR>
nmap <silent> <A-Right> :wincmd l <CR>
"set foldmethod=indent
"set foldlevel=1
"set foldclose=all
let mapleader = ","
autocmd BufEnter * silent! lcd %:p:h

 " install plugings
call plug#begin('~/.vim/plugged')
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'Raimondi/delimitMate'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

 " tags 
set tags=./.tags;,.tags

 " colorscheme
colorscheme molokai

 " gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

 " asyncrun
let g:asyncrun_open = 20
let g:asyncrun_rootmarks = ['.svn', '.root', '.git']
nnoremap <F10> :call asyncrun#quickfix_toggle(20)<cr>
nnoremap <F9> :AsyncRun -cwd=<root> make <cr>
nnoremap <F8> :AsyncRun -cwd=<root> make test <cr>
nnoremap <F7> :AsyncRun -cwd=<root> make clean <cr>

 " ale
let g:ale_linters = {'cpp': ['cppcheck', 'gcc']}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extension#ale#enable = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11 -fopenmp -I./../src -I./.. -I/home/zixihu/research/phase/src'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"let g:ale_c_cppcheck_executable = 'cppcheck'
"let g:ale_cpp_cppcheck_executable = 'cppcheck'
"let g:ale_sign_error = \ue009\ue009
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

 " airline
 let g:airline_theme='base16_bright'

  "youcompleteme
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion = '<c-z>'
noremap <c-z> <NOP>
"let g:ycm_filetype_whitelist = {'.cpp': 1, '.h': 1}
let g:ycm_semantic_triggers = {
                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'], 
                        \ 'cs,lua,javascript': ['re!\w{2}'],
                        \ }
let g:ycm_max_num_candidates = 10
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = "~"
"let g:ycm_filetype_blacklist = {'.txt': 1}

 " LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderTag<cr>
let g:Lf_StlSeparator = {'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

 " echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1

 " delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

 " alt-key
function! Terminal_MetaMode(mode)
	set ttimeout
	if $TMUX != ''
		set ttimeoutlen=30
	elseif &ttimeout > 80 || &ttimeout <= 0
		set ttimeoutlen=80
	endif
	if has('nvim') || has('gui_running')
		return
	endif
	function! s:metacode(mode,key)
		if a:mode == 0
			exec "set <M-".a:key.">=\e".a:key
		else
			exec "set <M-".a:key.">=\e]{0}".a:key."~"
		endif
	endfunc
	for i in range(10)
		call s:metacode(a:mode, nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(a:mode, nr2char(char2nr('a') + i))
		call s:metacode(a:mode, nr2char(char2nr('A') + i))
	endfor
	if a:mode != 0
		for c in [',', '.', '/', ';', '[', ']', '{', '}']
			call s:metamode(a:mode, c)
		endfor
		for c in ['?', ':', '-', '_']
			call s:metamode(a:mode, c)
		endfor
	else
		for c in [',', '.', '/', ';', '{', '}']
			call s:metacode(a:mode, c)
		endfor
		for c in ['?', ':', '-', '_']
			call s:metacode(a:mode, c)
		endfor
	endif
endfunc

call Terminal_MetaMode(0)
