"swp files
set directory-=.

":w + !perl command
map <F4>  :w !perl<CR>

"!perl command
map <F5>  :!perl %<CR>


"backup files
set backup
set backupdir=/tmp

set nocompatible
set number
syntax on
set scrolloff=5 " スクロール時の余白確保
map ¥ <leader>
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-h> <Left>
"imap <C-l> <Right>

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" text-edit

inoremap <C-d> <Del>
noremap <CR> i<CR><ESC>

" for perl files
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.t set filetype=perl
autocmd FileType perl set isfname-=-


if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM guibg=Purple guifg=NONE
endif

set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
" --- vundle ---
" vundleを使うためのおまじない
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle 'EnhCommentify.vim'
Bundle 'othree/html5.vim'
Bundle 'Shougo/unite.vim'
"Bundle 'scrooloose/syntastic'
": Bundle Install
filetype plugin indent on

autocmd FileType html :compiler tidy
autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ -i\ --gnu-emacs\ yes\ -modify\ \"%\"
nmap <buffer> <special> <silent> <F6> :!tidy -i -raw -quiet -modify "%"<CR>
set cursorline
"highlight CursorLine ctermbg=Yellow
"highlight CursorLine ctermfg=Blue

"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

" install vim application type to :BundleInstall
" http://qiita.com/items/3d186671b361672f1e51
" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Delete Key enable
set t_kD=^?

" 閉じ括弧入力時に対応する括弧の強調
set showmatch
  
" showmatch設定の表示秒数(0.1秒単位)
set matchtime=4

" 見た目によるカーソル移動をする(1行が複数行に渡って表示されている時に表示上の行ごとに上下移動させる)
nnoremap j gj
nnoremap k gk

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set scrolloff=5 " スクロール時の余白確保

" インサートモードでもhjklで移動（+Ctrl）
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" 以下のファイルの時は文字コードをutf-8に設定
augroup InsertHook
autocmd!
augroup END


autocmd FileType svn :set fileencoding=utf-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
autocmd FileType php :set fileencoding=utf-8
autocmd FileType txt :set fileencoding=utf-8
autocmd FileType ctp :set fileencoding=utf-8
autocmd FileType pl  :set fileencoding=utf-8
autocmd FileType pm  :set fileencoding=utf-8
autocmd FileType cgi :set fileencoding=utf-8
autocmd FileType t :set fileencoding=utf-8

"入力モード時、ステータスラインのカラーを変更
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90

" file type

"autocmd! BufRead,BufNewFile *.psgi,*.cgi,*.t  set filetype=perl




" text-edit
"inoremap <C-d> <Del>
"noremap <CR> i<CR><ESC>

map <F2> <ESC>:bp<CR> " 前のバッファ
map <F3> <ESC>:bn<CR> " 次のバッファ
map <F4> <ESC>:bw<CR> " バッファの削除
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"カーソル後の文字削除
inoremap <silent> <Del> <C-g>u<Del>
inoremap <silent> <C-g> <C-g>u<Del>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif



" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

set number

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
         
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'perl' : $HOME.'/.vim/dict/perl.dict',
\ }
                 
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif


let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
               
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() ."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :"\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


"------------------------------------
"" unite.vim
"------------------------------------
"" 入力モードで開始する
let g:unite_enable_start_insert=0
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" " レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" " 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" " 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" " 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>


nnoremap <silent> ,ex :Explore<CR>

"-- vim to prove
map ,t :!prove -lv % \| less

