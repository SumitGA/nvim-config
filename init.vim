" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_custom_ignore = 'node_modules\'
  let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
endif
set noswapfile

set encoding=utf8
 let g:airline_powerline_fonts = 5

"-------------------------------------------------------------
"---------------JavaScript Settings---------------------------
"-------------------------------------------------------------
"Javascript code auto formatting


"-----------------Auto Formatting settings----------------------
"stop executing the default auto indent and tabbing
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"Key binding for autoformattting
noremap <C-f> :Autoformat<CR>


" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif
"emmet key binding
let g:user_emmet_leader_key = '<C-f>'
let g:user_emmet_expandabbr_key = '<C-f>,'
let g:user_emmet_expandword_key = '<C-f>;'
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
colorscheme codeschool
set guifont=Monaco:h12
"let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
"set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
syntax enable
set smartindent
set noautoindent
filetype indent on
" set lightline theme inside lightline config
let g:lightline = { 'colorscheme' : 'dracula' }

" set airline theme


 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

 " unicode symbols
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

"UtilSnip configuration
 let g:UltiSnipsExpandTrigger="<c-space>"
 let g:UltiSnipsJumpForwardTrigger="<c-<>"
 let g:UltiSnipsJumpBackwardTrigger="<c->>"

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
"configuration for powershell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(),":~")'
let g:vimshell_prompt = '$ '
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2
let g:winresizer_gui_enable = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omi#input_patterns = {}
endif
"let g:deoplete#disable_auto_completer =
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call neobundle#begin(expand('$HOME/.config/nvim/bundle'))

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bling/vim-airline'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'zchee/deoplete-go', { 'do': 'make' }
NeoBundle 'zchee/deoplete-jedi'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'shougo/vimproc'
NeoBundle 'shougo/vimshell'
NeoBundle 'chrisbra/vim-commentary'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'jacoborus/tender.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'honza/vim-snippets'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'jimsei/winresizer'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'keith/rspec.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'marcweber/vim-addon-mw-utils'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'justinj/vim-react-snippets'
NeoBundle 'chiel92/vim-autoformat'
NeoBundle 'akmassey/vim-codeschool'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'powerline/powerline'
NeoBundle 'sirver/ultisnips'
NeoBundle 'isruslan/vim-es6'
NeoBundle 'chemzqm/vim-jsx-improve'
call neobundle#end()
filetype plugin indent on
syntax on
set number
set relativenumber

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleterJS
  autocmd FileType html setlocal omnifunc = htmlcomplete#CompleteTags
  autocmd FileType markdown setlocal omnifunc = htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern@Complete
endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

"key binding for refreshing the nerdtree
"nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

