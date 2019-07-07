set nocompatible
filetype off


if has('win32') || has ('win64')
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction

    let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

    if has('syntax')
        augroup InsertHook
            autocmd!
            autocmd InsertEnter * call s:StatusLine('Enter')
            autocmd InsertLeave * call s:StatusLine('Leave')
        augroup END
    endif

    let s:slhlcmd = ''
    function! s:StatusLine(mode)
        if a:mode == 'Enter'
            silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
            silent exec g:hi_insert
        else
            highlight clear StatusLine
            silent exec s:slhlcmd
        endif
    endfunction

    function! s:GetHighlight(hi)
        redir => hl
        exec 'highlight '.a:hi
        redir END
        let hl = substitute(hl, '[\r\n]', '', 'g')
        let hl = substitute(hl, 'xxx', '', '')
        return hl
    endfunction
endif


"---------------------------
"        add Setting        
"---------------------------

if has('kaoriya')
    let g:no_vimrc_example=0
    let g:vimrc_local_finish=1
    let g:gvimrc_local_finish=1

    "$VIM/plugins/kaoriya/autodate.vim
    let plugin_autodate_disable  = 1
    "$VIM/plugins/kaoriya/cmdex.vim
    let plugin_cmdex_disable     = 1
    "$VIM/plugins/kaoriya/dicwin.vim
    let plugin_dicwin_disable    = 1
    "$VIMRUNTIME/plugin/format.vim
    let plugin_format_disable    = 1
    "$VIM/plugins/kaoriya/hz_ja.vim
    let plugin_hz_ja_disable     = 1
    "$VIM/plugins/kaoriya/scrnmode.vim
    let plugin_scrnmode_disable  = 1
    "$VIM/plugins/kaoriya/verifyenc.vim
    let plugin_verifyenc_disable = 1
endif

"カラースキーム設定
colorscheme pablo
"新しい行のインデントを現在行と同じにする
set autoindent
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan

set iminsert=0

set imsearch=-1

"set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 入力中のコマンドを表示する
set showcmd

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

"スワップファイルを作るディレクトリ
set directory=$HOME/vimbackup

"アンドゥファイルを作るディレクトリ
set undodir==$HOME/vimbackup

if has('win32') || has ('win64')
    "ウィンドウを最大化して起動
    au GUIEnter * simalt ~x
endif


"---------------------------
"         keymap.           
"---------------------------

nnoremap = gg=G:w<CR>
nnoremap <C-j> <esc>
" nnoremap ; :
" nnoremap : ;
" nnoremap j gj
" nnoremap k gk
" nnoremap gj j
" nnoremap gk k
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" noremap h  ^
" noremap l  $
nnoremap <Space>/  *
" noremap <Space>m  %

inoremap <C-j> <esc>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>


"---------------------------
"   Neobundle Settings.     
"---------------------------

if has('vim_starting')
    " bundleで管理するディレクトリを指定
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

" neobundle自体をneobundleで管理
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle で管理するプラグインを追加します。
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/unite-outlie'
" NeoBundle 'neocomplete.vim'
" NeoBundle 'rcmdnk/vim-markdown'


call neobundle#end()


filetype plugin indent on

" インストールするかどうかを尋ねてくれるようにする設定
" NeoBundleCheck



" vimproc {{{
if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
                \ 'depends' : 'Shougo/vimproc',
                \ 'autoload' : { 'insert' : 1,}
                \ }
endif
" }}}

" syntastic {{{
if ! empty(neobundle#get("syntastic"))
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2
    " Disable automatic check at file open/close
    let g:syntastic_check_on_open=0
    let g:syntastic_check_on_wq=0
    " C
    let g:syntastic_c_check_header = 1
    " C++
    let g:syntastic_cpp_check_header = 1
    " Java
    let g:syntastic_java_javac_config_file_enabled = 1
endif
" }}}

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

" vim-markdown {{{
"let g:vim_markdown_folding_disabled = 1
" }}}


" nerdtree {{{
noremap <C-N> ::NERDTreeToggle<CR>
" }}}

" unite {{{
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
"noremap <C-N> :Unite buffer<CR>
" ファイル一覧
"noremap <C-P> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-P> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" }}}

" NeoBundleLazy 'osyo-manga/vim-stargate', {
"             \ 'autoload' : {'filetypes' : 'cpp'}
"             \}

" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.cpp =
"             \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" NeoBundleLazy 'Rip-Rip/clang_complete', {
"             \ 'autoload' : {'filetypes' : ['c', 'cpp']}
"             \ }

" NeoBundleLazy 'osyo-manga/vim-marching', {
"             \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
"             \ 'autoload' : {'filetypes' : ['c', 'cpp']}
"             \ }
" let g:marching_enable_neocomplete = 1

" NeoBundleLazy 'kana/vim-altr'






