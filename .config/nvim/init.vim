"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'Yohannfra/Nvim-Switch-Buffer'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title 
set number relativenumber 
set cursorline
set hidden  " Allow changing buffers without having to save them
set nobackup                    " No auto backups
set noswapfile                  " No swap
set ignorecase  " Ignore capital letters when searching 
set smartcase   " Do not ignore capital letters if the search word contains capital letters 
set noshowmode
map <A-q> :q<CR>

" Clipboard
let mapleader =","
map <Leader>y "+y
map <Leader>d "+d
map <Leader>pp "+p

" Compilation 
map ,p :!python <c-r>%<CR>
map ,m :!make<CR>
map ,j :!javac <c-r>%<CR>

" Correct words using dictionaries in English and Spanish
set spelllang=en,es 

" letra ñ y acentos ó
set fileencodings=latin1
set termencoding=utf-8
set encoding=utf-8

" Latex templates
nnoremap ,plx :-1read $HOME/.config/plantilla.tex<CR>

" Navigating with guides
inoremap ;gui <++>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Autocomplete 
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <A-e> :leftabove 30vs \|:Explore<CR>
map <A-e> :vs \|:Explore<CR>
map <A-f> :Explore<CR>
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide() "ignore git files
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nvim-Switch-Buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Feel free to map the shortcut you want
nnoremap S :SwitchBuffer <cr>
set switchbuf=usetab
let g:switch_buffer_hide_numbers = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <A-S-h> <C-w>h
nnoremap <A-S-j> <C-w>j
nnoremap <A-S-k> <C-w>k
nnoremap <A-S-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-l> :vertical resize +3<CR>
noremap <silent> <C-h> :vertical resize -3<CR>
noremap <silent> <C-k> :resize +3<CR>
noremap <silent> <C-j> :resize -3<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map t :7sp \|term<CR>
tnoremap <Esc> <C-\><C-n>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

highlight NormalColor ctermbg=22 ctermfg=255
highlight InsertColor ctermbg=4 ctermfg=255
highlight VisualColor ctermbg=9 ctermfg=255
highlight ReplaceColor ctermbg=255 ctermfg=0

set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#LineNr#
set statusline+=\ %f    "Path to the file
set statusline+=%r      "Readonly flag
set statusline+=%m\ \|  "Modified flag
set statusline+=%#Title#
set statusline+=%{StatuslineGit()} "Branch git
" switching to right side
set statusline+=%=
set statusline+=%#DiffAdd#       
set statusline+=\ %y    "filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%      " Percentage through file in line
set statusline+=\ %l:%c\    "Line number and Column number

