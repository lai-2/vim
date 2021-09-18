let mapleader="," 

nnoremap <leader>h :noh<CR> " toggle search highlighting
map <leader>vd :call ToggleThemeMode('dark')<CR>
map <leader>va :call ToggleThemeMode('')<CR>

" Prevent d to cut
nnoremap d "_d
vnoremap d "_d
nnoremap <leader>d d

nnoremap c "_c
nnoremap <leader>c c

" Backspace to remove tab previous
set backspace=indent,eol,start

"Map jj to ESC" 
inoremap jj <ESC>

" Use ctrl-[hjkl] to select the active split
nnoremap <silent> <C-k> <c-w>k<CR>
nnoremap <silent> <C-j> <c-w>j<CR>
nnoremap <silent> <C-h> <c-w>h<CR>
nnoremap <silent> <C-l> <c-w>l<CR>

" Toggle NERDTree
nnoremap <C-b> :NERDTreeToggle<CR> 
nnoremap <C-i> :NERDTreeFind<CR> " search file

