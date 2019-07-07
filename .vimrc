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

"�J���[�X�L�[���ݒ�
colorscheme pablo
"�V�����s�̃C���f���g�����ݍs�Ɠ����ɂ���
set autoindent
"�t�@�C���ۑ��_�C�A���O�̏����f�B���N�g�����o�b�t�@�t�@�C���ʒu�ɐݒ�
set browsedir=buffer 
"�N���b�v�{�[�h��Windows�ƘA�g
set clipboard=unnamed
"�^�u�̑���ɋ󔒕�����}������
set expandtab
"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\��
set hidden
"�C���N�������^���T�[�`���s��
set incsearch
"�^�u�����A�s���ȂǕs��������\������
set list
"list�ŕ\������镶���̃t�H�[�}�b�g���w�肷��
set listchars=eol:$,tab:>\ ,extends:<
"�s�ԍ���\������
set number
"�V�t�g�ړ���
set shiftwidth=4
"�����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������
set showmatch
"�������ɑ啶�����܂�ł������/�������
set smartcase
"�V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
set smartindent
"�s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����B
set smarttab
"�t�@�C������ <Tab> ���Ή�����󔒂̐�
set tabstop=4
"�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]
"�������t�@�C���̐擪�փ��[�v���Ȃ�
set nowrapscan

set iminsert=0

set imsearch=-1

"set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" �E�C���h�E�̃^�C�g���o�[�Ƀt�@�C���̃p�X��񓙂�\������
set title

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
augroup InsertHook
    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"���{����͂����Z�b�g
au BufNewFile,BufRead * set iminsert=0

"�^�u�������Z�b�g
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".rhtml��.rb�Ń^�u����ύX
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

"�S�p�X�y�[�X�����o��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /�@/

" �R�}���h���C�����[�h��<Tab>�L�[�ɂ��t�@�C�����⊮��L���ɂ���
set wildmenu

" ���͒��̃R�}���h��\������
set showcmd

"�o�b�N�A�b�v�t�@�C�������f�B���N�g��
set backupdir=$HOME/vimbackup

"�X���b�v�t�@�C�������f�B���N�g��
set directory=$HOME/vimbackup

"�A���h�D�t�@�C�������f�B���N�g��
set undodir==$HOME/vimbackup

if has('win32') || has ('win64')
    "�E�B���h�E���ő剻���ċN��
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
    " bundle�ŊǗ�����f�B���N�g�����w��
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

" neobundle���̂�neobundle�ŊǗ�
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle �ŊǗ�����v���O�C����ǉ����܂��B
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

" �C���X�g�[�����邩�ǂ�����q�˂Ă����悤�ɂ���ݒ�
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
" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert=1
" �o�b�t�@�ꗗ
"noremap <C-N> :Unite buffer<CR>
" �t�@�C���ꗗ
"noremap <C-P> :Unite -buffer-name=file file<CR>
" �ŋߎg�����t�@�C���̈ꗗ
noremap <C-P> :Unite file_mru<CR>
" sources���u���J���Ă���t�@�C���̃f�B���N�g���v�Ƃ���
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" �E�B���h�E�𕪊����ĊJ��
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
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






