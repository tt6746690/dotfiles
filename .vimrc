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
Plugin 'tmux-plugins/vim-tmux'              " syntax highlight for .tmux.conf
Plugin 'pangloss/vim-javascript'            " js indentation and syntax
Plugin 'leafgarland/typescript-vim'         " syntax highlight for typescript
Plugin 'lervag/vimtex'                      " latex in vim
if has('nvim')
    Plugin 'Valloric/YouCompleteMe'             " auto completion
endif

call vundle#end()            " required
filetype plugin indent on    " load plugins according to detected filetype

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
let g:vim_markdown_folding_disabled = 1             " disable folding
let g:vim_markdown_math = 1                         " writing inline latex without escape
let g:vim_markdown_json_frontmatter = 1             " format json
let g:vim_markdown_new_list_item_indent = 0         " disable indent on next-line o
let g:vim_markdown_no_extensions_in_markdown = 1    " `ge` on [text](link_url) go to link_url.md instead of link_url
let g:vim_markdown_autowrite = 1                    " autowrite on `ge`



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
let g:syntastic_c_remove_include_errors = 1     " remove check from included files
noremap <Leader>n :SyntasticToggleMode<CR> 


" vim-smooth-scroll 
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 1)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 1)<CR>

" auto-pairs 
let g:AutoPairsFlyMode=1


" == Personal Tweaks ==
set number 

set autoindent                              " indent according to previous line
set expandtab                               " use space instead of tabs
set softtabstop =4                          " tab key indents by 4 spaces
set shiftwidth  =4                          " >> indents by 4 spaces
set shiftround                              " >> indents to next multiple of 'shiftwidth'

set backspace   =indent,eol,start           " backspace now indents backward properly
set hidden                                  " switch between buffer without having to save first
set laststatus  =2                          " always show statusline

set noshowmode                              " unset show current mode in command-line, since using airline
set showcmd                                 " show already typed words when more are expected

set incsearch                               " highlight when search wiht / or ?
set hlsearch                                " keeps match highlighted
noremap <Leader>s :set hlsearch!<CR>        " resets highlight
set ignorecase
set smartcase                               " /LINUX will search for LINUX only whereas /linux search ignore case
set wrapscan                                " searches wrap around EOF

set splitbelow                              " open new window below current window 
set splitright                              " open new window right of current window 

set scrolloff=999                           " keep cursor centered while scrolling
noremap <Leader>zz :let &scrolloff=999-&scrolloff<CR> 

:set lazyredraw                             " make scrolling faster

let g:MY_multiscroll = 0                    " toggle between j/k scrolling modes for fast navigation
function! MultiScroll()
    if g:MY_multiscroll
        noremap j 5j
        noremap k 5k
        let g:MY_multiscroll = 0
    else
        noremap j j
        noremap k k
        let g:MY_multiscroll = 1
    endif
endfunction 

map <Leader>k :call MultiScroll()<RETURN>
map <Leader>j :call MultiScroll()<RETURN>

map <c-l> >> <cr>                           " indent short-cut
map <c-h> << <cr>                                



 
syntax enable                               " theme
set background=light
colorscheme gruvbox

" gruvbox
let g:gruvbox_termcolors=256            " defaults
let g:gruvbox_contrast_light="soft"     " soft, medium, hard

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



