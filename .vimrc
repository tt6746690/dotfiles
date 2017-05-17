"=  Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " plugin manager 
Plugin 'tpope/vim-fugitive'                 " git wrapper 
Plugin 'tpope/vim-surround'                 " quoting / parenthesizing
Plugin 'vim-syntastic/syntastic'            " linter, error check 
Plugin 'morhetz/gruvbox'                    " theme
Plugin 'altercation/vim-colors-solarized'   
Plugin 'scrooloose/nerdtree'                " tree explorer
Plugin 'godlygeek/tabular'                  " text filtering and alignment
Plugin 'plasticboy/vim-markdown'            " markdown syntax 
Plugin 'wincent/command-t'                  " fuzzy file search 
Plugin 'terryma/vim-smooth-scroll'		    " smooth scrolling 
Plugin 'scrooloose/nerdcommenter'           " quick commenting 
Plugin 'jiangmiao/auto-pairs'               " bracketing 
Plugin 'bling/vim-airline'                  " statusline
Plugin 'vim-scripts/a.vim'                  " .c -> .h
if has('nvim')
    Plugin 'Valloric/YouCompleteMe'             " auto completion
endif

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Change leader to space
" let mapleader = "\<space>"
map <Space> <Leader>

" sourcing vimrc file 
noremap <Leader>r :source $MYVIMRC<CR> 

" use vim for adding crontab -e
autocmd filetype crontab setlocal nobackup nowritebackup

"== Configure vim packages == 
" ycm
if has("nvim")
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_cache_omnifunc=0          " not caching completion items
endif

"vim-markdown 
let g:vim_markdown_math = 1                   " writing inline latex without escape
let g:vim_markdown_json_frontmatter = 1       " format json

" Command T 
nmap <silent> <Leader>j <Plug>(CommandTJump)
let g:CommandTMatchWindowReverse = 1 	" match shown s.t. best at bottom 
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"   "skip search 	
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTCancelMap='<C-c>'		    " exit from file window
let g:CommandTMaxHeight=5
let g:CommandTMaxFiles=5000

" NERD-Tree 
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git$[[dir]]', '.swp$[[file]]', 'node_modules$[[dir]]']	" ignore file display	
let NERDTreeChDirMode=1			        " CWD changed upong setting tree root 
let NERDTreeShowBookmarks=1		        " show bookmark can toggle with NERDTree-B
let NERDTreeShowHidden=0		        " not showing .files toggle with NERDTree-I
nmap <leader>o :NERDTreeToggle<cr>	

" Nerd Comment 
let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting

" statusline 
set laststatus=2   
set statusline=                                 " wipe out existing string
set statusline+=%y\ %f                          " file
set statusline+=%=%-8.(%l,%c%V%)\ (%P)          " percentage 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
noremap <Leader>n :SyntasticToggleMode<CR> 


" vim-smooth-scroll 
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 1)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 1)<CR>

" auto-pairs 
let g:AutoPairsFlyMode=1


" == Personal Tweaks ==
set number 
set showcmd
set tabstop=4                               " show existing tab with 4 spaces width
set shiftwidth=4                            " when indenting with '>', use 4 spaces width
set expandtab                               " On pressing tab, insert 4 spaces

" search 
set hlsearch 
noremap <Leader>s :set hlsearch!<CR> 
set ignorecase
set smartcase                               " /LINUX will search for LINUX only whereas /linux search ignore case
set incsearch

" keep cursor centered while scrolling
set scrolloff=999
noremap <Leader>zz :let &scrolloff=999-&scrolloff<CR> 

" theme 
syntax enable
set background=light
colorscheme gruvbox

" gruvbox
let g:gruvbox_termcolors=256            " defaults
let g:gruvbox_contrast_light="hard"     " soft, medium, hard

" highlight style 
highlight Normal ctermbg=NONE cterm=NONE
highlight StatusLine ctermbg=NONE cterm=NONE
highlight TabLineFill ctermfg=NONE ctermbg=NONE
highlight TabLine ctermfg=NONE ctermbg=234
highlight TabLineSel ctermfg=234 ctermbg=220,bold

" Convenience function 
nnoremap <Leader>w :w<cr> 
nnoremap <Leader>q :q<cr>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>      



