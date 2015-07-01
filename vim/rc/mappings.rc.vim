"---------------------------------------------------------------------------
" Key-mappings:
"

" Move key "{{{
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap 1 ^
vnoremap 1 ^
nnoremap 0 $
vnoremap 0 $
"}}}

" Easy escape."{{{
inoremap jj           <ESC>
" inoremap <expr> j       getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
cnoremap <expr> j       getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
onoremap jj           <ESC>

inoremap j<Space>     j
onoremap j<Space>     j
"}}}

"
" a>, i], etc... "{{{
" <angle>
onoremap aa  a>
xnoremap aa  a>
onoremap ia  i>
xnoremap ia  i>

" [rectangle]
onoremap ar  a]
xnoremap ar  a]
onoremap ir  i]
xnoremap ir  i]

" (circle)
onoremap ac  a)
xnoremap ac  a)
onoremap ic  i)
xnoremap ic  i)

" {wave}
onoremap av  a}
xnoremap av  a}
onoremap iv  i}
xnoremap iv  i}

" 'quote'
onoremap aq  a'
xnoremap aq  a'
onoremap iq  i'
xnoremap iq  i'

" "double quote"
onoremap ad  a"
xnoremap ad  a"
onoremap id  i"
xnoremap id  i"
"}}}


" Fast buffer alternation, next/prev, close "{{{
map ga <C-^>
nmap gn :bn<CR>
nmap gp :bp<CR>
nmap gk :bp<bar>bd #<CR>
"}}}


" Change window size "{{{
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
"}}}

" Inactivate no need keys "{{{
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap Q <Nop>
"}}}

