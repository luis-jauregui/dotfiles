"HTML
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx' 

"Lightlane
"let g:lightline = {
      "\ 'active': {
      "\   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      "\   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      "\ },
      "\ 'inactive': {
      "\   'left': [['inactive'], ['relativepath']],
      "\   'right': [['bufnum']]
      "\ },
      "\ 'component': {
      "\   'bufnum': '%n',
      "\   'inactive': 'inactive'
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'fugitive#head',
      "\   'kitestatus': 'kite#statusline'
      "\ },
      "\ 'colorscheme': 'gruvbox',
      "\ 'subseparator': {
      "\   'left': '',
      "\   'right': ''
      "\ }
      "\}

"coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"configuracion indentLine
let g:indentLine_fileTypeExclude = ["coc-explorer", "nerdtree"]
let g:indentLine_bufTypeExclude = ["terminal"]

"nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"kite 
"autocmd FileType javascript let b:coc_suggest_disable = 1
"autocmd FileType python let b:coc_suggest_disable = 1
"autocmd FileType scss setl iskeyword+=@-@
"let g:kite_supported_languages = ['python']

"if &filetype == "python"
"  inoremap <c-space> <C-x><C-u>
"else
"  inoremap <silent><expr> <c-space> coc#refresh()
"endif

"configuracion de coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('vim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"configuracion de coc-snippets

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<s-e>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<s-q>'


let g:python_highlight_all=1
let g:vim_jsx_pretty_colorful_config = 1
set re=0


let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-calc',
\ ]
