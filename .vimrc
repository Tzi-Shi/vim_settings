 " basic 
set vb
set tabstop=4
set number
set mouse=a
set signcolumn=yes
set switchbuf=vsplit
set hlsearch
:noremap <F4> :set hlsearch! hlsearch?<CR> 
let mapleader = ","

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
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.svn', '.root', '.git']
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <F9> :AsyncRun -cwd=<root> make <cr>

 " ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extension#ale#enable = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

 " airline
 let g:airline_theme='base16_bright'

 " youcompleteme
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion = '<c-z>'
"set completeopt = menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers = {
						\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'], 
						\ 'cs,lua,javascript': ['re!\w{2}'],
						\ }
let g:ycm_filetype_whitelist = {"c":1, "cpp":1, "h":1, "makefile":1, "vimrc":1}
let g:ycm_max_num_candidates = 15
let g:ycm_max_num_identifier_candidates = 15

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
