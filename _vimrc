"-----------------------------------------------------
"
"                o
"              _<|>_
"
"   o      o     o    \o__ __o__ __o   \o__ __o      __o__
"  <|>    <|>   <|>    |     |     |>   |     |>    />  \
"  < >    < >   / \   / \   / \   / \  / \   < >  o/
"   \o    o/    \o/   \o/   \o/   \o/  \o/       <|
"    v\  /v      |     |     |     |    |         \\
"     <\/>      / \   / \   / \   / \  / \         _\o__</
"
"
"-----------------------------------------------------
" 基本的な設定
"-----------------------------------------------------
" release autogroup in MyAutoCmd
" augroup MyAutoCmd
"   autocmd!
" augroup END
"色設定
syntax enable
" let g:solarized_termcolors=256
" colorscheme solarized
" set background=dark
" colorscheme earendel
" colorscheme nu42dark
" colorscheme jellybeans
" colorscheme inkpot
" colorscheme molokai
colorscheme hybrid
" colorscheme mydark
set t_Co=256
" viとの互換性をとらない(vimの拡張機能を使うため）
set nocompatible
"行頭の余白内でTabを打ち込むと'shiftwidth'の数だけインデントする
set smarttab
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースで削除できるものを指定
set backspace=indent,eol,start
"" Leader
let mapleader = ","
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.rb **/*.js **/*.erb **/*.haml<CR>:cw<CR>
" Path
" let path = "~/my_settings"
" 8進数を10進数として扱う
set nrformats-=octal
"ペーストを受け付ける
" set paste
" マウスを使える場合はvim内で使用可能にする
if has("mouse")
  set mouse=a
endif
" UTF-8の□や○でカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
" set wildmode=longest:full,list
set foldmethod=marker

"-----------------------------------------------------
" キーバインド変更
"-----------------------------------------------------
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" 行頭・行末移動方向をキーの相対位置にあわせる
" nnoremap 0 $
" nnoremap 1 0
" map CTRL-E to end-of-line (insert mode)
" map CTRL-A to beginning-of-line (insert mode)
" imap  <C-a> <Home>
" nmap  <CR> o<ESC>
" nmap  <Enter> o<ESC>
nmap  <C-_> o<ESC>
imap  <C-e> <End>
imap  <C-a> <C-o>^
imap  <C-w> <esc>bcw
imap  <C-b> <Left>
imap  <C-f> <Right>
imap  <C-u> <C-u><C-o>d0
" imap  <C-x> <esc>xi
imap  <C-n> <Down>
imap  <C-p> <Up>
imap  <C-d> <Del>
" imap  <C-k> <C-o>d$

inoremap <expr> <C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
map   <C-j> <C-w>p
" let mapleader = ","
"  map  % <C-o>:%s/

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

noremap <Leader>W :silent !open /Applications/Firefox.app %<CR>
"-----------------------------------------------------
" テンプレート関連
"-----------------------------------------------------
autocmd BufNewFile *.py 0r $HOME/.vim/template/py.txt
autocmd BufNewFile *.php 0r $HOME/.vim/template/php.txt

"-----------------------------------------------------
" ファイル操作関連
"-----------------------------------------------------
" Exploreでカレントディレクトリを開く
set browsedir=current

"-----------------------------------------------------
" バックアップ関連
"-----------------------------------------------------
" バックアップをとる
set backup
if !filewritable($HOME."/.vim-backup")
  call mkdir($HOME."/.vim-backup", "p")
endif
set backupdir=$HOME/.vim-backup
if !filewritable($HOME."/.vim-swap")
  call mkdir($HOME."/.vim-swap", "p")
endif
set directory=$HOME/.vim-swap
"let &directory = &backup dir
" ファイルの上書き前にバックアップ作成。成功したら削除
set writebackup

"-----------------------------------------------------
" 検索関係
"-----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=1000
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻らない
set nowrapscan
" インクリメンタルサーチを使う
set incsearch
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

"------------------------------
" マーク関係
"------------------------------
if !exists('g:markrement_char')
  let g:markrement_char = [
        \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        \ ]
endif
nnoremap <silent>m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
  if !exists('b:markrement_pos')
    let b:markrement_pos = 0
  else
    let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
  endif
  execute 'mark' g:markrement_char[b:markrement_pos]
  echo 'marked' g:markrement_char[b:markrement_pos]
endfunction
" let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"
"-----------------------------------------------------
" 表示関係
"-----------------------------------------------------
" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示しない
"set nonumber
" 行番号を表示する
set number
" ルーラーを表示
set ruler
" 現在のカーソル行をハイライト
set cursorline
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時に対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を3にする
"set matchtime=3
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメントの色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu
" 行末から次の行へ移るようにする
set whichwrap=b,s,[,],<,>
" set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 行末の空白をハイライト
" highlight WhitespaceEOL ctermbg=red guibg=red
" autocmd WinEnter * match WhitespaceEOL /\s\+$/
" matc WhitespaceEOL /\s\+$/
" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
matc ZenkakuSpace /　/

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
" function! s:remove_dust()
"     let cursor = getpos(".")
"     " 保存時に行末の空白を除去する
"     %s/\s\+$//ge
"     " 保存時にtabを2スペースに変換する
"     " %s/\t/  /ge
"     call setpos(".", cursor)
"     unlet cursor
" endfunction
" autocmd BufWritePre * call <SID>remove_dust()
" markdownファイルの時は空白をハイライトする
highlight UnderLined cterm=NONE ctermbg=darkgray guibg=#FF0000
function! s:RTrim()
  let s:cursor = getpos(".")
  if &filetype == "markdown"
    %s/\s\+\(\s\{2}\)$/\1/e
    match UnderLined /\s\{2}/
  else
    %s/\s\+$//ge
  endif
  call setpos(".", s:cursor)
endfunction
autocmd BufWritePre * call <SID>RTrim()

" markdownでsyntaxハイライト
let g:markdown_fenced_languages = [
\  'css',
\  'sh',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'scala',
\  'php',
\  'python',
\  'py=python',
\  'ruby',
\  'sass',
\  'xml',
\]


" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=%c\:%l/%L:
set statusline+=%{b:charCounterCount}
set statusline+=\|%P\|
" ステータスラインの色
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=gray
"-----------------------------------------------------
" 移動
"-----------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap <space><space> :<C-u>edit ~/.vimrc<CR>
nnoremap <space>s :<C-u>source ~/.vimrc<CR>

"-----------------------------------------------------
" タブ
"-----------------------------------------------------
" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使う
set expandtab
" インデントをオプションの'shiftwidth'の値の倍数に丸める
set shiftround

"-----------------------------------------------------
" インデント
"-----------------------------------------------------
" オートインデントを有効にする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う。 'cindent'
" がオンのときは、'smartindent' をオンにしても効果はない。
set smartindent

"----------------------------------------------------
"" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
"set encoding=japan
set termencoding=utf-8
set fileencoding=utf-8

"----------------------------------------------------
" vim-tab
"----------------------------------------------------
" nnoremap <C-k> :Texplore<Return>
" nnoremap <C-l> :tabnext<Return>
" nnoremap <C-h> :tabprevious<Return>

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed,autoselect
endif
" set clipboard+=unnamedplus,unnamed
" 矩形選択で連番入力
" 数字を選んで co と入力
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"-----------------------------------------------------
" 文字数カウント
"-----------------------------------------------------
" statusbarにファイル中の文字数を表示

if exists("anekos_charCounter")
  finish
endif
let anekos_charCounter=1

augroup CharCounter
  autocmd!
  autocmd BufCreate,BufEnter * call <SID>Initialize()
  autocmd BufUnload,FileWritePre,BufWritePre * call <SID>Update()
augroup END

function! s:Initialize()
  if exists('b:charCounterCount')
  else
    return s:Update()
  endif
endfunction

function! s:Update()
  let b:charCounterCount = s:CharCount()
endfunction

function! s:CharCount()
  let l:result = 0
  for l:linenum in range(0, line('$'))
    let l:line = getline(l:linenum)
    let l:result += strlen(substitute(l:line, ".", "x", "g"))
  endfor
  return l:result
endfunction

function! AnekoS_CharCounter_CharCount()
  return s:CharCount()
endfunction

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" 洗濯してccで文字数カウント
vnoremap <silent> cc :s/./&/gn<Esc><Esc> <CR>
" vを二回で行末まで選択
vnoremap v $h


"----------------------------------------------------
" その他
"----------------------------------------------------

" 入力モード中に素早くjjと入力した場合はESCとみなす
" 入力モード中に素早く;;と入力した場合はESCとみなす
inoremap  ;;  <Esc>
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" filetype on
" filetype plugin on

"-----------------------------------------------------
" Plugins
"-----------------------------------------------------

" gocode
set rtp+=$GOROOT/misc/vim
" golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle/
call vundle#rc()

" NeoBundleの設定
" NeoBundleLazyで遅延ロードする
Bundle 'Shougo/neobundle.vim'
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
  " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切
  " 読み込まない
  let s:noplugin = 1
else
  " NeoBundleを'runtimepath'に追加し初期化を行う
  if has('vim_starting')
    execute "set runtimepath+=" . s:neobundle_root
  endif
  call neobundle#rc(s:bundle_root)

  " NeoBundle自身をNeoBundleで管理させる
  NeoBundleFetch 'Shougo/neobundle.vim'

  " 非同期通信を可能にする
  " 'build'が指定されているのでインストール時に自動的に
  " 指定されたコマンドが実行され vimproc がコンパイルされる
  NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}

  " (ry

  " インストールされていないプラグインのチェックおよびダウンロード
  NeoBundleCheck
endif
let g:neobundle_default_git_protocol='git'

NeoBundle 'gmarik/vundle'
" let Vundle manage Vundle
" required!
"-----------------------------------------------------
" 文法チェック
"-----------------------------------------------------

" Go
NeoBundle 'Blackrush/vim-gocode'


" Template
" :Template hogehoge
NeoBundle "mattn/sonictemplate-vim"

" Scala syntax
NeoBundle 'derekwyatt/vim-scala'
set makeprg=sbtc\ --exec\ compile

NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': ['javascript', 'json', 'ruby', 'php'],
      \ 'passive_filetypes': ['java', 'scala', 'python'],
      \}


" augroup AutoSyntastic
"   autocmd!
"   autocmd InsertLeave * call s:syntastic()
" augroup END
function! s:syntastic()
  w
  SyntasticCheck
endfunction
nmap <Leader>S :SyntasticCheck<CR>

let g:syntastic_javascript_checker = 'JSHINT'
" 相対行がぬるぬる表示される
" NeoBundle 'myusuf3/numbers'
" solarizedカラースキーマ
" NeoBundle 'altercation/vim-colors-solarized'

"-----------------------------------------------------
" Neocomplcache
"-----------------------------------------------------

" if_luaが有効ならneocompleteを使う
" NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
"
" if neobundle#is_installed('neocomplete')
"   " neocomplete用設定
"   let g:neocomplete#enable_at_startup = 1
"   let g:neocomplete#enable_ignore_case = 1
"   let g:neocomplete#enable_smart_case = 1
"   if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
"   endif
"   let g:neocomplete#keyword_patterns._ = '\h\w*'
" elseif neobundle#is_installed('neocomplcache')
"   " neocomplcache用設定
"   let g:neocomplcache_enable_at_startup = 1
"   let g:neocomplcache_enable_ignore_case = 1
"   let g:neocomplcache_enable_smart_case = 1
"   if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
"   endif
"   let g:neocomplcache_keyword_patterns._ = '\h\w*'
"   let g:neocomplcache_enable_camel_case_completion = 1
"   let g:neocomplcache_enable_underbar_completion = 1
" endif
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" NeoBundle 'Shougo/neocomplcache'
NeoBundleLazy "Shougo/neocomplcache.vim", {
  \ "autoload": {
    \   "insert": 1,
      \ }}

set completeopt=menuone
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
  \ 'html' : $HOME.'/.vim/dict/javascript.dict',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }
" 文字deleteのさくさく化
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

"--------------------------------------------------
" unite.vim
"--------------------------------------------------
" C-u uで現在開いているファイルと同ディレクトリのファイルを開く
" C-u iでunite経由で既に開いたファイルを開く
" C-u cで最初に開いたファイルのディレクトリのファイルを開く
" C-u r よく分からない
" NeoBundle 'Shougo/unite.vim'

NeoBundle "Shougo/unite.vim"
" NeoBundleLazy "Shougo/unite.vim", {
"       \ "autoload": {
"       \   "commands": ["Unite", "UniteWithBufferDir"]
"       \ }}

let g:unite_enable_start_insert=1
nnoremap [unite] <Nop>
nmap <space>u [unite]
nnoremap <silent> [unite]u :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]i :<C-u>Unite -buffer-name=files buffer_tab<CR>
nnoremap <silent> [unite]g :<C-u>Unite vcs_grep/git<CR>
function! s:unite_my_settings()
  " Overwrite settings
  nmap <buffer><ESC> <Plug>(unite_exit)
  nmap <buffer><C-c> <Plug>(unite_exit)
  "imap <buffer>jj <Plug>(unite_insert_leave)
  imap <buffer><C-w> <Plug>(unite_delete_backward_path)
  " <C-l>: manual neocomplecache completion.
  inoremap <buffer><C-l> <C-x><C-u><C-p><Down>
  nmap <buffer><expr><C-d> unite#do_action('delete')
  imap <buffer><expr><C-d> unite#do_action('delete')
  nmap <buffer><expr><C-b> unite#do_action('bookmark')
  imap <buffer><expr><C-b> unite#do_action('bookmark')
  nmap <buffer><expr><C-k> unite#do_action('split')
  imap <buffer><expr><C-k> unite#do_action('split')
  nmap <buffer><expr><C-i> unite#do_action('vsplit')
  imap <buffer><expr><C-i> unite#do_action('vsplit')
endfunction

" NeoBundle 'Shougo/vimfiler'
NeoBundleLazy "Shougo/vimfiler", {
      \ "depends": ["Shougo/unite.vim"],
      \ "autoload": {
      \   "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"],
      \   "mappings": ['<Plug>(vimfiler_switch)'],
      \   "explorer": 1,
      \ }}

" space-eでウィンドウ左側にファイルツリー表示
nnoremap <silent> <space>e :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>

" NeoBundle 'h1mesuke/unite-outline'
NeoBundleLazy 'h1mesuke/unite-outline', {
      \ "autoload": {
      \   "unite_sources": ["outline"],
      \ }}

NeoBundleLazy 'tsukkee/unite-help', {
      \ "autoload": {
      \   "unite_sources": ["help"],
      \ }}

NeoBundle 'sgur/unite-git_grep'


"--------------------------------------------------
" neocomplcache
"--------------------------------------------------

NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neocomplete'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" call vam#ActivateAddons(['neosnippet', 'neosnippet-snippets'])

" Plugin key-mappings.
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"--------------------------------------------------
" UltiSnips
" 動かない
"--------------------------------------------------
" set runtimepath+=~/.vim/bundle/ultisnips/
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" " let g:UltiSnipsSnippetsDir ="~/.vim/snippets"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"
" " Snippets are separated from the engine. Add this if you want them:
" NeoBundleLazy 'honza/vim-snippets'
" " NeoBundleLazy 'honza/vim-snippets', {
" "       \ "autoload": {
" "       \   "insert": 1,
" "       \ }}
"
"
" " Track the engine.
" NeoBundleLazy 'SirVer/ultisnips'
" " NeoBundleLazy 'SirVer/ultisnips', {
" "       \ "autoload": {
" "       \   "insert": 1,
" "       \ }}
"
"--------------------------------------------------
" smart input & smart chr
"--------------------------------------------------

NeoBundleLazy 'kana/vim-smartchr', {
      \ "autoload": {"filetypes": ['php', 'python', 'scala', 'ruby']}
      \}
NeoBundleLazy 'kana/vim-smartinput', {
      \ "autoload": {"filetypes": ['php', 'python', 'scala', 'ruby']}
      \}
NeoBundleLazy "cohama/vim-smartinput-endwise", {
      \ "autoload": {"filetypes": ['php', 'python', 'scala', 'ruby']}
      \}

call smartinput_endwise#define_default_rules()
"
" " \%#はカーソル位置
"
let s:bundle  =  neobundle#get('vim-smartinput')
function! s:bundle.hooks.on_source(bundle)
"   let lst = [
"         \ ['<', "smartchr#loop(' < ', ' << ', '<')" ],
"         \ ['>', "smartchr#loop(' > ', ' >> ', ' >>> ', '>')"],
"         \ ['+', "smartchr#loop(' + ', ' ++ ', '+')"],
"         \ ['-', "smartchr#loop(' - ', ' -- ', '-',' -')"],
"         \ ['/', "smartchr#loop(' / ', ' // ', '/', '//')"],
"         \ ['&', "smartchr#loop(' & ', ' && ', '&')"],
"         \ ['%', "smartchr#loop(' % ', '%')"],
"         \ ['*', "smartchr#loop(' * ', ' ** ', '*', '**')"],
"         \ ['=', "smartchr#loop(' = ', ' == ', ' === ', '=')"],
"         \ ['<Bar>', "smartchr#loop(' | ', ' || ', '|')"],
"         \ [',', "smartchr#loop(', ', ',')"]
"         \]
"
"   for i in lst
"     call smartinput#map_to_trigger('i', i[0], i[0], i[0])
"     call smartinput#define_rule({'char': i[0], 'at': '\%#', 'input': '<C-R>='.i[1].'<CR>'})
"     " call smartinput#define_rule({'char': i[0], 'at': '^ \+ \%#', 'input': i[0]})
"     call smartinput#define_rule({'char': i[0], 'at': '[^<>+-/&%*=| ] \%#', 'input': '<BS><C-R>='.i[1].'<CR>'})
"     call smartinput#define_rule({'char': i[0], 'at': '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#', 'input': i[0]})
"     call smartinput#define_rule({'char': i[0], 'at': '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#', 'input': i[0]})
"   endfor
"
  call smartinput#map_to_trigger('i', '<Enter>', '<Enter>', '<Enter>')
  call smartinput#define_rule({'char': '<Enter>', 'at': '(\%#)', 'input': '<Enter><Enter><UP><Tab>'})
  call smartinput#define_rule({'char': '<Enter>', 'at': '{\%#}', 'input': '<Enter><Enter><UP><Tab>'})
"
"   call smartinput#map_to_trigger('i', '>', '>', '>')
"   call smartinput#define_rule({'char': '>', 'at': ' < \%#', 'input': '<BS><BS><><Left>'})
"   call smartinput#define_rule({'char': '>', 'at': ' = \%#', 'input': '<BS><BS>=> '})
"   call smartinput#define_rule({'char': '>', 'at': ' - \%#', 'input': '<BS><BS>-> '})
"
"   call smartinput#map_to_trigger('i', '-', '-', '-')
"   call smartinput#define_rule({'char': '-', 'at': ' < \%#', 'input': '<BS><BS><- '})
"
"   call smartinput#map_to_trigger('i', '=', '=', '=')
"   call smartinput#define_rule({'char': '=', 'at': '[&+-/<>|] \%#', 'input': '<BS>= '})
"   call smartinput#define_rule({'char': '=', 'at': '!\%#', 'input': '= '})
"
"   call smartinput#map_to_trigger('i', '/', '/', '/')
"   call smartinput#define_rule({'char': '/', 'at': '  / \%#', 'input': '<BS><BS><BS>// '})
"
  call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
  call smartinput#define_rule({'char': '<BS>', 'at': '(\s*)\%#', 'input': '<C-O>dF(<BS>'})
  call smartinput#define_rule({'char': '<BS>', 'at': '{\s*}\%#', 'input': '<C-O>dF{<BS>'})
  call smartinput#define_rule({'char': '<BS>', 'at': '<\s*>\%#', 'input': '<C-O>dF<<BS>'})
  call smartinput#define_rule({'char': '<BS>', 'at': '\[\s*\]\%#', 'input': '<C-O>dF[<BS>'})

  call smartinput#map_to_trigger('i', '<C-h>', '<BS>',  '<C-h>')
  call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')

  call smartinput#map_to_trigger('i', '<C-h>', '<C-h>', '<BS>')
  call smartinput#define_rule({'char': '<C-h>', 'at': '(\s*)\%#', 'input': '<C-O>dF(<BS>'})
  call smartinput#define_rule({'char': '<C-h>', 'at': '{\s*}\%#', 'input': '<C-O>dF{<BS>'})
  call smartinput#define_rule({'char': '<C-h>', 'at': '<\s*>\%#', 'input': '<C-O>dF<<BS>'})
  call smartinput#define_rule({'char': '<C-h>', 'at': '\[\s*\]\%#', 'input': '<C-O>dF[<BS>'})

  for op in ['<', '>', '+', '-', '/', '&', '%', '\*', '|', '=', ',']
    call smartinput#define_rule({'char': '<BS>', 'at': ' ' . op . ' \%#', 'input': '<BS><BS><BS>'})
    call smartinput#define_rule({'char': '<C-h>', 'at': ' ' . op . ' \%#', 'input': '<BS><BS><BS>'})
    call smartinput#define_rule({'char': '<Space>', 'at': ''.op.' \%#', 'input': ''})
    call smartinput_endwise#define_default_rules()
  endfor
endfunction
unlet s:bundle


"--------------------------------------------------
" Utility
"--------------------------------------------------

NeoBundle 'tyru/caw.vim.git'
" <Leader>cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

NeoBundle 'thinca/vim-qfreplace'
" NeoBundle 'milkypostman/vim-togglelist'
"
" nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
" nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

function! Toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    copen
  endif
endfunction
nnoremap <Leader>q :call Toggle_quickfix_window()<CR>
" Command-T
NeoBundle 'wincent/Command-T'

" vimsehll
" vsでvimshellを起動
NeoBundle 'Shougo/vimshell.git'
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USER."% "
"vimshell map
nmap vs :VimShell<CR>
nmap vp :VimShellPop<CR>

NeoBundle 'majutsushi/tagbar'
" TagBar
nmap <silent>tb :TagbarToggle<CR>
" nmap <F8> :TagbarToggle<CR>

NeoBundle 'szw/vim-tags'
" let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
" let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
nnoremap <C-]> g<C-]>
nnoremap tt :TagsGenerate<CR>

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
nnoremap <Leader>G :Ggrep!
" nnoremap <Leader>G :Ggrep! | copen

NeoBundle 'kana/vim-fakeclip'

" nerdtree
" ファイル管理(tree表示)
" \nでファイルツリー表示
NeoBundle 'scrooloose/nerdtree'
nmap <Leader>n :NERDTreeToggle<CR>
nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
omap <silent> <C-e> :NERDTreeToggle<CR>
" imap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeShowHidden=1

" Undo関係
" undoの履歴を残せる
" 既に編集し終わったファイルでもuで遡れる
" NeoBundle 'sjl/gundo.vim'
NeoBundle 'mbbill/undotree'
set undodir=~/.vimundo
set undofile
if has('persistent_undo')
  set undodir=./.vimundo,~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif
" " UndoTree
" " \uで開く
" nmap U :<C-u>GundoToggle<CR>
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
" let g:undotree_SplitLocation = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

" YankRing.vim
NeoBundle 'YankRing.vim'
" pでペーストした後，C-p,C-nで過去のものに切り替わっていく
" \ y でヤンク履歴
nmap <Leader>y :YRShow<CR>
" vim surrond
NeoBundle 'tpope/vim-surround'
" コマンド  実行前  実行後
" ds"   "Hello World"   Hello world
" ds(   (Hello World)   Hello World
" ds)   (Hello World)   Hello World
" dst   <p>Hello World</p>  Hello World
" cs"'  "Hello World"   'Hello World'
" cs([  (Hello World)   [ Hello World ]
" cs(]  (Hello World)   [Hello World]
" cs)[  (Hello World)   [ Hello World ]
" cs)]  (Hello World)   [Hello World]
" cst<b>  <p>Hello World</p>  <b>Hello World</b>
" ys$"  Hello World Now   Hello W"orld Now"
" ysw'  Hello World Now   Hello W'orld' Now
" ysiw)   Hello World Now   Hello (World) Now
" yss"  Hello World Now   "Hello World Now"

"-----------------------------------------------------
" インデントの可視化
"-----------------------------------------------------
" set list
" set listchars=eol:\ ,trail:-
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" インデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_enabled=1
let g:indentLine_color_term=200
let g:indentLine_loaded = 1
let g:indentLine_char = ">"

"-----------------------------------------------------
" jedi-vimの設定
" Pythonのためのプラグインだよ
"-----------------------------------------------------
NeoBundleLazy "alfredodeza/khuno.vim", {
    \ "autoload": {"filetypes": ['python','python3']}}
let g:khuno_ignore="E113,E123,E126,E127,E128,E251,E501,E502"
nmap <silent><Leader>xs <Esc>:Khuno show<CR>
nmap <silent><Leader>xon <Esc>:Khuno on<CR>
nmap <silent><Leader>xoff <Esc>:Khuno off<CR>

" NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
function! InitPython()
    " jedi.vimとpyhoncompleteがバッティングし得るらしいので
    " http://mattn.kaoriya.net/software/vim/20121018212621.htm
    let b:did_ftplugin = 1
    setlocal commentstring=#%s
    " rename用のマッピングを無効にしたため、代わりにコマンドを定義
    setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
endfunction
autocmd BufEnter * if &filetype == 'python' | call InitPython() | endif


let s:bundle = neobundle#get("jedi-vim")
function! s:bundle.hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#show_function_definition = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " <Leader>rでリネームする
  let g:jedi#rename_command = '<Leader>r'
  command! -nargs=0 JediRename :call jedi#rename()
  let g:jedi#pydoc = '<Leader>k'
endfunction
unlet s:bundle

autocmd FileType python let b:did_ftplugin = 1
NeoBundleLazy 'vim-scripts/pythoncomplete', {
    \ "autoload": {"filetypes": ['python']}}
autocmd FileType python set omnifunc=pythoncomplete#Complete

"-----------------------------------------------------
" ruby設定
"-----------------------------------------------------
NeoBundle 'tpope/vim-endwise'
NeoBundle 'bbatsov/rubocop'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
"-----------------------------------------------------
" zen-coding設定
"-----------------------------------------------------
" NeoBundle 'mattn/emmet-vim'
NeoBundleLazy 'mattn/emmet-vim', {
    \ "autoload": {"filetypes": ['html']}}
" let g:user_emmet_settings = {
"       \ 'indentation': '  ',
"       \ 'lang': 'ja'
"       \}
" HTMLが開かれるまでロードしない
" NeoBundleLazy 'mattn/zencoding-vim', {
"     \ "autoload": {"filetypes": ['html']}}
" let g:user_zen_settings = {
let g:user_emmet_settings = {
      \  'lang' : 'ja',
      \  'indentation' : '  ',
      \  'html' : {
      \    'filters' : 'html',
      \    'snippets' : {
      \      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\n<script>\n\\$(function() {\n\t|\n});\n</script>",
      \      'jsrender': "<script src=\"http://borismoore.github.com/jsrender/jsrender.js\"></script>",
      \      'render': "<script type=\"text/x-jsrender\">\n\t|\n</script>",
      \      'jqui' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js\"></script>\n<link type=\"css/text\" href=\"https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/ui-lightness/jquery-ui.css\" rel=\"stylesheet\" />",
      \      'cd' : "<![CDATA[|]]>",
      \      'r' : "<%= %>",
      \      'end' : "<% end %>",
      \      'br' : "<br />",
      \    },
      \  },
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'html,c',
      \  },
      \  'py' : {
      \    'encoding' : '\# -*- encoding:utf-8 -*-',
      \    'path' : '\#!/usr/local/bin/python'
      \   },
      \  'javascript' : {
      \    'snippets' : {
      \      'jq' : "\\$(function() {\n\t\\${cursor}\\${child}\n});",
      \      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
      \      'jq:each' : "\\$.each(data, function(index, item) {\n\t\\${child}\n});",
      \      'fn' : "(function() {\n\t\\${cursor}\n})();",
      \      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
      \    },
      \    'use_pipe_for_cursor' : 0,
      \  },
      \  'css' : {
      \    'filters' : 'fc',
      \    'snippets' : {
      \      'box-shadow' : "-webkit-box-shadow: 0 0 0 # 000;\n-moz-box-shadow: 0 0 0 0 # 000;\nbox-shadow: 0 0 0 # 000;",
      \    },
      \  },
      \  'less' : {
      \    'filters' : 'fc',
      \    'extends' : 'css',
      \  },
      \}

" let g:user_zen_expandabbr_key = '<c-e>'

"-----------------------------------------------------
"html, css, javascript関係
"-----------------------------------------------------
NeoBundle 'mattn/webapi-vim'
" NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'JavaScript-syntax'
" NeoBundle 'teramako/jscomplete-vim'
" autocmd FileType javascript :set omnifunc=jscomplete#completeJS
" autocmd FileType html :set omnifunc=jscomplete#completeJS

autocmd FileType javascript :compiler gjslint
autocmd QuickFixCmdPost make copen
let g:netrw_nogx = 1 " disable netrw's gx mapping.

"-----------------------------------------------------
" Quick Run
"-----------------------------------------------------
" NeoBundle 'osyo-manga/unite-quickrun_config'
" NeoBundle 'thinca/vim-quickrun'
" let g:quickrun_config = {}
" let g:quickrun_config._ = {
"       \ 'runner' : 'vimproc',
"       \ 'runner/vimproc/updatetime' : 100,
"       \ 'outputter/buffer/split' : 'botright 8sp',
"       \ 'outputter' : 'quickfix',
"       \}
"
" NeoBundleLazy 'osyo-manga/unite-quickrun_config', {
"       \ 'depends': [
"       \ 'Shougo/unite.vim',
"       \ 'thinca/vim-quickrun',
"       \ ],
"       \ }
" NeoBundleSource 'unite-quickrun_config'

NeoBundleLazy 'thinca/vim-quickrun', {
      \ 'autoload': {
      \ 'filetypes': ['ruby',  'python', 'sh', 'scala', 'java']
      \}}
nmap <space>r :QuickRun -runner vimproc <CR>
" nmap <space>r <plug>(quickrun)
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
" 読み込めない...
let g:quickrun_config = {
      \ '_': {
      \ 'runner' : 'vimproc',
      \ 'runner/vimproc/updatetime' : 30,
      \ 'outputter/buffer/split' : 'botright 8sp',
      \ 'outputter' : 'quickfix',
      \}}

" quickrun_configがうまく読み込めない
" let s:bundle = neobundle#get('vim-quickrun')
" function! s:bundle.hooks.on_source(bundle)
"   let g:quickrun_config = {}
"   let g:quickrun_config._ = {
"         \ 'runner' : 'vimproc',
"         \ 'runner/vimproc/updatetime' : 30,
"         \ 'outputter/buffer/split' : 'botright 8sp',
"         \ 'outputter' : 'quickfix',
"         \}
" endfunction
" unlet s:bundle

"-----------------------------------------------------
" GIST.vim の設定 実行は :Gist
" :Gist -l でgist一覧
" :Gist -s hoge でタイトル付きで投稿
"-----------------------------------------------------

" NeoBundle 'mattn/gist-vim'
NeoBundleLazy "mattn/gist-vim", {
      \ "depends": ["mattn/webapi-vim"],
      \ "autoload": {
      \   "commands": ["Gist"],
      \ }}

let g:github_user = 'usrename'
let g:github_token = 'token'
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
" Gistのヘルパースクリプト(.vim/autoload/gist_vim_helper.vim)
command! -nargs=? -range=% GHPostGist call gist_vim_helper#post_cmd(<count>, <line1>, <line2>, <f-args>)
command! -nargs=? -range=% GHEditGist call gist_vim_helper#edit_cmd(<count>, <line1>, <line2>, <f-args>)
command! -nargs=? -range=% GHAutoGist call gist_vim_helper#auto_cmd(<count>, <line1>, <line2>, <f-args>)
" githubのusernameとaccess tokenは.vimrc.localに保存
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
let g:gist_curl_options = '-k'
" -Pオプション(:Gist -P でpublicに)
let g:gist_private = 'private'
" PasteGist  実行は :PasteGist
func! s:paste_gist_tag()
  let mx = 'http[s]\?://gist.github.com/\([0-9]\+\)'
  " +または"レジスタの中身を検索する
  let regs = [@+,@"]
  for r in regs
    let mlist = matchlist(r, mx)
    if ( len(mlist) > 2 )
      "カーソル行に挿入
      exe "normal! O<script src='https://gist.github.com/" . mlist[1] . ".js'></script>"
      return
    endif
  endif
endfunc
command! -nargs=0 PasteGist     call <sid>paste_gist_tag()

" HybridText
" txtファイルのカラーリング？
NeoBundle 'vim-scripts/HybridText'
" autocmd BufEnter * if &filetype == "text" | setlocal ft=hybrid | endif
au BufRead,BufNewFile *.txt set syntax=hybrid

" ファイルタイププラグインおよびインデントの有効化
filetype plugin indent on
"-----------------------------------------------------
" 文字コードの自動認識
"-----------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
"
" if has('iconv')
"   let s:enc_euc = 'euc-jp'
"   let s:enc_jis = 'iso-2022-jp'
"   " iconvがeucJP-msに対応しているかをチェック
"   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'eucjp-ms'
"     let s:enc_jis = 'iso-2022-jp-3'
"     " iconvがJISX0213に対応しているかをチェック
"   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'euc-jisx0213'
"     let s:enc_jis = 'iso-2022-jp-3'
"   endif
"   " fileencodingsを構築
"   if &encoding ==# 'utf-8'
"     let s:fileencodings_default = &fileencodings
"     let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"     let &fileencodings = &fileencodings .','. s:fileencodings_default
"     unlet s:fileencodings_default
"   else
"     let &fileencodings = &fileencodings .','. s:enc_jis
"     set fileencodings+=utf-8,ucs-2le,ucs-2
"     if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"       set fileencodings-=cp932
"       set fileencodings-=euc-jp
"       set fileencodings-=euc-jisx0213
"       set fileencodings-=eucjp-ms
"       let &encoding = s:enc_euc
"       let &fileencoding = s:enc_euc
"     else
"       let &fileencodings = &fileencodings .','. s:enc_euc
"     endif
"   endif
"   " 定数を処分
"   unlet s:enc_euc
"   unlet s:enc_jis
" endif
" " 日本語を含まない場合は fileencoding に encoding を使うようにする
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]

