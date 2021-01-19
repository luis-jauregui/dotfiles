let mapleader = " "

nnoremap <leader>fs :Files<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" nerdtree
map <leader>r :NERDTreeFind<CR>

" git
nmap <leader>G :G<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gl :Gpull<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" open file 
nnoremap <F3> :exec ':silent !firefox % '<CR>


" run current file
nnoremap <F2> :!node %<CR>


:
