" Use Vim settings
set nocompatible
filetype off

" ================ General Config ============================================

set number				" Line numbers
set backspace=indent,eol,start		" Allow backspace in insert mode
set history=1000	      	  	" Store :cmdline history
set showcmd		      	  	" Show incomplete commands 
set showmode		      	  	" Show current mode
set autoread		      	  	" Reload files changed outside Vim
set cursorline				" Highlight current line
set colorcolumn=80			" Add colored guide column
set foldenable				" Enable folding
set foldlevelstart=10
set tabstop=4
set shiftwidth=4
set expandtab
syntax on		      	  	" Turn on syntax highlighting

" ================ Initialize Vim-Plug =======================================
call plug#begin('~/.vim/plugged')	" Specify directory for plugins

" ---------------- Plugins ---------------------------------------------------

Plug 'scrooloose/nerdtree'		" File browsing
Plug 'tpope/vim-fugitive'		" Git integration
Plug 'vim-airline/vim-airline'		" Status bar
Plug 'arcticicestudio/nord-vim'		" Add Nord theme to airline
Plug 'mattn/emmet-vim'              " Support for exapnding abbreviations


" Code-completion for Vim
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()				" Initialize plugin system
" ================ Theming ===========================

colorscheme nord			"Getting Vim to Look Nice

" ================ Key Mapping ===============================================
map <C-n> :NERDTreeToggle<CR>
