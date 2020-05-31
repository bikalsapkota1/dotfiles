set nocompatible	"current millenium
filetype off

set rtp+=~/.vim/bundle/Vundle.vim     "set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree',{'on':'NerdTreeToogle'}
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-syntastic/syntastic'
Plugin 'tomline/vim-solidity'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'zxqfl/tabnine-vim'

call vundle#end()
filetype plugin indent on

"finding files
set path+=**		"provides tab-completion for all file related tasks
set wildmenu		"display all matching files when we tab complete

"" NOW WE CAN:
" " - Hit tab to :find by partial match
" " - Use * to make it fuzzy
"
" " THINGS TO CONSIDER:
" " - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags
"
syntax on	"syntax highlighting
set showmatch
set number relativenumber 	"shoe relative number
set ruler
set hlsearch incsearch
set ts=4
set shortmess+=A
set encoding=utf-8 		"required by youcompleteme

"manage splits
set splitbelow splitright


"automatically compile file whenever i finished writing
	autocmd BufWritePost config.h,config.def.h !sudo make install

"nerdtree
	map <C-t> :NERDTree<CR>

"set vim wiki in markdown form VimWiki is in default form
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}] 
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'index': 'main'}]

"setting the leader key as space 
let mapleader = " "


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'python' ]
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_flake8_config_file='.flake8'

