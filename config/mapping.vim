"Key your save
nnoremap <leader>w :w<CR>

"Key your quit
nnoremap <leader>q :q<CR>

"Key to explorer
noremap <leader>e :NvimTreeToggle<CR>

"Key to vim easymotion
nmap <leader>s <Plug>(easymotion-s2)

"Key for plugin update
noremap <leader>pu :PlugUpdate<CR>

"Executing lenguajes
nnoremap <leader>njs :!node %<CR>
nnoremap <leader>df :Prettier<CR>
nnoremap <leader>py :!python %<CR>

"Buffer keys

nnoremap <leader>j :BufferPrevious<CR>
nnoremap <leader>k :BufferNext<CR>
nnoremap <leader>b :DashboardNewFile<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>c :BufferClose<CR>

"Move buffers

nnoremap <leader>mj :BufferMovePrevious<CR>
nnoremap <leader>mk :BufferMoveNext<CR>

"Resize splits vim
noremap <leader><Left> :vertical resize -5<CR>
noremap <leader><Right> :vertical resize +5<CR>
noremap <leader><Up> :resize +5<CR>
noremap <leader><Down> :resize -5<CR>

"Find history files
nnoremap <silent> <Leader>th :Telescope oldfiles<CR>

"Find files in folder
nnoremap <silent> <Leader>tf :Telescope find_files<CR>

"Change colorscheme
nnoremap <silent> <Leader>tc :Telescope colorscheme<CR>

"Search words
nnoremap <silent> <Leader>tw :Telescope current_buffer_fuzzy_find<CR>

" Select the complete menu item like CTRL+y would.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

