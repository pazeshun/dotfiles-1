" Use Default Dark theme
set background=dark
colorscheme default
" Make vim more useful
set nocompatible
" Use the OS clipboard by default
" (on versions compiled with `+clipboard`)
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  elseif s:uname == "Linux\n"
    set clipboard=unnamedplus
  endif
endif
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Enable syntax highlighting
syntax on
" Softtabs, 2 spaces
set shiftround
set expandtab
" Allow backspace in insert mode
set backspace=indent,eol,start
" Respect modeline in files
set modeline
set modelines=4
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
set modifiable
set ttymouse=xterm2
" Enable mouse in all modes
set mouse=a
" Ignore case of searches
set ignorecase
" Show the cursor position
set ruler
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set history=50
set commentstring=\ #\ %s
set autoindent
set browsedir=buffer
set expandtab
set hidden
" Highlight dynamically as pattern is typed
set incsearch
set number
set showmatch
set smartcase
set smartindent
set smarttab
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan
set shiftround
set infercase
set virtualedit=all
set hidden
set switchbuf=useopen
set showmatch
set matchtime=3
set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start
set nowritebackup
set nobackup
" set undofile
set noswapfile
set nofoldenable
set list
set number
set wrap
set t_vb=
set novisualbell
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set cinoptions+=:0,g0

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

" Specific settings according to filetype ------------------------------
au BufNewFile,BufRead * set iminsert=0 tabstop=2 shiftwidth=2 wrap
au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.pyx set ft=python tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.cfg set ft=python tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.c set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.cpp set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.sh set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.zsh set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.bash set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.launch set tabstop=2 shiftwidth=2 ft=xml
au BufNewFile,BufRead *.md set tabstop=4 shiftwidth=4 ft=markdown
au BufNewFile,BufRead *.py set colorcolumn=80

autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/include/c++/4.8/,/opt/ros/indigo/include,/usr/include/pcl-1.7

" lisp
au BufNewFile,BufRead *.l set wrap tabstop=8 shiftwidth=2 ft=lisp
let lisp_rainbow = 1

" Highlight Zenkaku Space ------------------------------------
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" NeoBundle -------------------------------------------------  
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" required
NeoBundleFetch 'Shougo/neobundle.vim'
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
endif
NeoBundle 'wkentaro/conque.vim'
NeoBundle 'ompugao/ros.vim'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-template'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'hattya/python_fold.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kana/vim-altr'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/L9'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'greyblake/vim-preview'
NeoBundle 'gerw/vim-latex-suite'

let vimproc_updcmd = has('win64') ?
      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'windows' : vimproc_updcmd,
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" NeoComplete -------------------------------------------------  
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_ignore_case = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
" endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" noremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd filetype python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Move Keymapping -------------------------------------------------  
" vnoremap 1 0
" nnoremap 1 0
" vnoremap 0 $
" nnoremap 0 $
" nnoremap n nzz
" nnoremap N Nzz
" nnoremap * *zz
" nnoremap # #zz
" nnoremap g* g*zz
" nnoremap g# g#zz
"
" fast buffer alternation, next/prev, close
map ga <C-^>
nmap gn :bn<CR>
nmap gp :bp<CR>
nmap gk :bp<bar>bd #<CR>

" Quicker window movement
nmap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Change Window Size -------------------------------------------------  
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" Change tabs -------------------------------------------------  
map <Space> :tabn<CR>
map <S-Space> :tabp<CR>

" Search -------------------------------------------------  
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" vimshell ------------------------------------------------- 
" nnoremap <silent> ,is :vsp<CR>:VimShell<CR>
" nnoremap <silent> <C-B> :sp<CR>:VimShell<CR>
" nnoremap <silent> ,ls :VimShell<CR>
" nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" vmap <silent> ,ss :VimShellSendString<CR>
" nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
" nnoremap <silent> ,ls :ConqueTerm bash<CR>
nnoremap <silent> ,ls :ConqueTerm zsh <CR>
" nnoremap <silent> ,ts :ConqueTermTab zsh<CR>
nnoremap <silent> ,is :ConqueTerm ipython <CR>
"
" vim-latex ------------------------------------------------- 
filetype plugin on
set grepprg=grep\ -nH\ $*
set shellslash
let g:tex_conceal=''
let tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi;open $*.pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
au BufNewFile,BufRead *.tex inoremap 、 ,
au BufNewFile,BufRead *.tex inoremap 。 .
au BufNewFile,BufRead *.tex inoremap （ (
au BufNewFile,BufRead *.tex inoremap ） )

" quickrun ------------------------------------------------- 
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1,
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <silent> ,r :QuickRun<CR>

" open-browser ------------------------------------------------- 
nmap <silent> ,w <Plug>(openbrowser-open)

" unite ------------------------------------------------- 
let g:unite_enable_start_insert=1
noremap <C-p> :Unite buffer<CR>
noremap <C-n> :Unite -buffer-name=file file<CR>
noremap <C-]> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-c> <ESC>:q<CR>

" fugitive ------------------------------------------------- 
autocmd QuickFixCmdPost *grep* cwindow

" lightline ------------------------------------------------- 
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['fugitive', 'filename', 'cakephp', 'currenttag', 'anzu'] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'anzu': 'anzu#search_status',
      \ }
      \ }


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? ' ' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return ' ' . fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" vim-indent-guides ------------------------------------------------- 
colorscheme default
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgray ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=darkgray ctermbg=8

" vim-repeat ------------------------------------------------- 
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" vim-filter ------------------------------------------------- 
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
noremap <silent> ,f :VimFiler -split -explorer<CR>

" vim-markdown -------------------------------------------------
let g:vim_markdown_codeblock_syntax=0
hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg

" jedi
autocmd FileType python setl omnifunc=jedi#completions
autocmd FileType python setl completeopt-=preview
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#show_call_signatures = 0
let s:hooks = neobundle#get_hooks("jedi-vim")

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.python =
  \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'


" template
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    silent! %s/<+FILENAME+>/\=expand('%')/g
endfunction
autocmd MyAutoCmd User plugin-template-loaded
    \   if search('<+HERE+>')
    \ |   silent! execute 'normal! "_da>'
    \ | endif

" snippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/after/snippets'

" For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif

" Change Mode ---
inoremap jj <ESC>
nmap <C-3> <Plug>IMAP_JumpForward
vmap <C-3> <Plug>IMAP_JumpForward

" HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"

" emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '  '[:&tabstop]
augroup END

" taglist.vim
noremap <silent> ,t :TlistToggle<CR>

" syntastic
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
nnoremap <silent> ,e :SyntasticCheck<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {"level": "warning"}
" au BufNewFile,BufRead *.l let g:syntastic_quiet_messages = {"level": "error"}
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_config_file = '~/.clang_complete'

" clang_complete
" cmd option
" let g:clang_use_library=1
" let g:clang_debug=1
if has('mac')
  let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/'
else
  " let g:clang_library_path = '/usr/lib'
  let g:clang_library_path = '/usr/lib/llvm-3.4/lib'
endif
let g:clang_user_options = '-std=c++11'
" use with neocomplete.vim
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" don't auto complete with clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0

" for InstantRst
let g:instant_rst_browser = 'chrome'
let g:instant_rst_forever = 1

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
nnoremap Gvdiff Gdiff