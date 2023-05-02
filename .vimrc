" BASIC SETTINGS ------------------------------------------- {{{
" Line Num
set nu
" Syntax
syntax on
" Column, character
set ruler
" Use mouse
set mouse+=a
" Use sys clipboard
set clipboard=unnamed

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" --------------------------------------------------------- }}}

" INDENTATION --------------------------------------------- {{{
set autoindent
set smartindent
set expandtab
set wrap
set linebreak
set shiftwidth=2
set tabstop=2

autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
" --------------------------------------------------------- }}}

" AUTOCOMPLETE cmd ---------------------------------------- {{{
set wildmenu
set wildmode=list:longest
set wildignorecase
set wildignore=*.git/*,*.tags,tags,*.o,*.class,*.ccls-cache
" --------------------------------------------------------- }}}

" Status Line
set laststatus=2

" VIM PLUG ----------------------------------- {{{
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'tomasr/molokai'
Plug 'zeis/vim-kolor'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'dominikduda/vim_current_word'
Plug 'eslint/eslint'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()
" ------------------------------------------- }}}

" VIM KOLOR --------------------------------- {{{
" Enable italic. Default: 1
let g:kolor_italic=1
" Enable bold. Default: 1
let g:kolor_bold=1
" Enable underline. Default: 0
let g:kolor_underlined=1
" Gray 'MatchParen' color. Default: 0
let g:kolor_alternative_matchparen=1
colorscheme kolor
set background=dark

" Italicise comments
hi Comment cterm=italic
" ------------------------------------------- }}}

" SEARCH -------------------------------------------------- {{{
set hlsearch
set showmatch
set showcmd

autocmd CursorMoved * exe printf('match WordUnder /\V\<%s\>/', escape(expand('<cword>'), '/\'))
hi WordUnder ctermfg = 3
" --------------------------------------------------------- }}}

" Variable Highlighting =================================== {{{
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
highlight CurrentWordTwins ctermfg=172 ctermbg=172 cterm=bold,italic
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1
highlight CurrentWord ctermfg=202 ctermbg=202 cterm=bold,italic
let g:vim_current_word#highlight_only_in_focused_window = 1
" ========================================================= }}}

" VIM PURIFY -------------------------------- {{{
"let g:purify_inverse = 1     " default: 1
"colorscheme purify
"hi Normal guibg=#252834 ctermbg=234
" ------------------------------------------- }}}

" SPACEVIM ================================== {{{
"colorscheme space-vim-dark
"hi Comment cterm=italic
" =========================================== }}}

" GIT BRANCH ----------------------------------------------------------- {{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
  "return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction
" ---------------------------------------------------------------------- }}}

" VIM AIRLINE ---------------------------------------------------------- {{{
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1

"airline themes
let g:airline_theme='kolor'

"airline sections
let g:airline_section_a = airline#section#create(['mode'," "])
let g:airline_section_b = airline#section#create_left([StatuslineGit()])
let g:airline_section_c = airline#section#create(['filetype'])
"let g:airline_section_c = '%-0.10{getcwd()}'
"let g:airline_section_c = '%t'
let g:airline_section_x = airline#section#create(['ffenc'])
let g:airline_section_y = airline#section#create(['%P'])
let g:airline_section_z = airline#section#create_right(['%l','%c'])

" ---------------------------------------------------------------------- }}}

" GRUVBOX ---------------------------------- {{{
" let g:gruvbox_contrast_dark = "hard"
" let g:gruvbox_italicize_comments = 0
" ------------------------------------------ }}}

" MOLOKAI ---------------------------------- {{{
" let g:molokai_original = 1
" ------------------------------------------ }}}

" VIM COMMENTARY
autocmd FileType apache setlocal commentstring=#\ %s

" JSX/TSX
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
