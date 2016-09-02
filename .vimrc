se nocp mls=4
syn on
se hls
se ruler
se filetype=off

"call pathogen#infect() 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" let Vundle manage Vundle, required
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'jedi-vim'
"Plugin 'SuperTab'
Plugin 'The-NERD-tree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pig.vim'
Plugin 'fatih/vim-go'
call vundle#end()

filetype plugin indent on

"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff
highlight Pmenu ctermfg=cyan ctermbg=black guibg=brown gui=bold

" YouAutoComplete fix
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" NERDTree related keys
map <C-n> :NERDTreeToggle<CR>
map <C-h> <C-w><C-w>
let mapleader=","

set laststatus=2
"set encoding=utf-8
"let g:Powerline_symbols = 'fancy'

augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END
"autocmd FileType python set colorcolumn=120 completeopt-=preview
