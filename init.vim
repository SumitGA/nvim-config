
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

"let g:netrw_listyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"augroup ProjectDrawer
	"autocmd!
	"autocmd VimEnter * :Vexplore
"augroup END

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme dracula

" set lightline theme inside lightline config
let g:lightline = { 'colorscheme' : 'tender' }

" set airline theme
let g:airline_theme = 'tender'

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
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'jimsei/winresizer'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'keith/rspec.vim'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'tpope/vim-fugitive'
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
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

