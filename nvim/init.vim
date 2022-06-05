"-----------------------------------------------------
"      ___                       ___           ___           ___
"     /\__\          ___        /\__\         /\  \         /\  \
"    /:/  /         /\  \      /::|  |       /::\  \       /::\  \
"   /:/  /          \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \
"  /:/__/  ___      /::\__\  /:/|:|__|__   /::\~\:\  \   /:/  \:\  \
"  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\
"  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / \/_|::\/:/  / \:\  \  \/__/
"  |:|__/:/  /  \::/__/           /:/  /     |:|::/  /   \:\  \
"   \::::/__/    \:\__\          /:/  /      |:|\/__/     \:\  \
"    ~~~~         \/__/         /:/  /       |:|  |        \:\__\
"                               \/__/         \|__|         \/__/
"
"-----------------------------------------------------
" 基本的な設定
"-----------------------------------------------------
"色設定
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
" 8進数を10進数として扱う
set nrformats-=octal
set nrformats+=alpha
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
set display=lastline
set pumheight=10
set nofoldenable

setlocal omnifunc=syntaxcomplete#Complete
"-----------------------------------------------------
" filetypeのalias
"-----------------------------------------------------
au BufRead,BufNewFile,BufReadPre *coffee   set filetype=coffee
au BufRead,BufNewFile,BufReadPre *vimperatorrc   set filetype=vim
au BufRead,BufNewFile,BufReadPre *zsh*   set filetype=sh
au BufRead,BufNewFile,BufReadPre *gradle   set filetype=groovy
au BufRead,BufNewFile,BufReadPre *conf   set filetype=conf
au BufRead,BufNewFile,BufReadPre *gohtmltmpl   set filetype=html
au BufRead,BufNewFile,BufReadPre *dig   set filetype=yaml
autocmd FileType gitcommit :set formatoptions=q

"-----------------------------------------------------
" キーバインド変更
"-----------------------------------------------------
" Leader
let mapleader = ","
" TODOを探す
" noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.rb **/*.js **/*.erb **/*.haml<CR>:cw<CR>
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" vを二回で行末まで選択
vnoremap v $h

" インサートモード
imap <C-e> <End>
" imap  <C-a> <Home>
imap <C-a> <C-o>^
" imap <expr> <C-w> (matchstr(getline('.'), '.', col('.')-1) =~ '[^\s\n\t\r\f$]' ? '<C-o>db' : '<C-o>daw')
" imap  <C-w> <C-o>db
" imap  <C-w> <C-o>db<C-o>x
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-n> <C-o>j
imap <C-p> <C-o>k
imap <C-u> <C-u><C-o>d0
imap <C-d> <Del>
imap <expr> <C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
" コマンドモード
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" ノーマルモード
map <C-k> <C-w>p
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-_> o<ESC>
map E <End>
map J gJ

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" quickfixでnextとprev
au FileType qf nnoremap <silent><buffer>q :quit<CR>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap j gj
nnoremap k gk
nnoremap <space><space> :<C-u>edit ~/.config/nvim/init.vim<CR>
nnoremap <space>s :<C-u>source ~/.config/nvim/init.vim<CR>
nnoremap <space>p :<C-u>edit ~/.config/nvim/rc/plugins.rc.vim<CR>
" nnoremap ; :
" nnoremap : ;

" paste with overwrite
noremap p "0p
noremap P "0P
vnoremap <sirent> p "0p

" 入力モード中に素早くjjと入力した場合はESCとみなす
" 入力モード中に素早く;;と入力した場合はESCとみなす
" inoremap  ;;  <Esc>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

"-----------------------------------------------------
" テンプレート関連
"-----------------------------------------------------
" autocmd BufNewFile *.py -r $HOME/.vim/template/py.txt
" autocmd BufNewFile *.php -r $HOME/.vim/template/php.txt
" autocmd BufNewFile *.rkt -r $HOME/.vim/template/rkt.txt

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

"------------------------------
" マーク関係
" mでマーク `でジャンプ
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
set matchtime=1
" シンタックスハイライトを有効にする
syntax on
" syntax enable
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメントの色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu
" 行末から次の行へ移るようにする
" 行末に移動
" set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
" set wrap
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" 行末の空白をハイライト
" highlight WhitespaceEOL ctermbg=red guibg=red
" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermfg=white guifg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
" autocmd WinEnter * match WhitespaceEOL /\s\+$/

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
matc ZenkakuSpace /　/

" 保存時に末尾の空白を削除
" markdownファイルの時は空白をハイライトする
" highlight UnderLined cterm=NONE ctermbg=darkgray guibg=#FF0000
function! s:RTrim()
  let s:cursor = getpos(".")
  if &filetype == "markdown" || &filetype == "gitcommit"
    %s/\s\+\(\s\{2}\)$/\1/e
    match UnderLined /\s\{2}/
  else
    %s/\s\+$//ge
  endif
  call setpos(".", s:cursor)
endfunction
" autocmd BufWritePre * call <SID>RTrim()

" markdownでsyntaxハイライト
let g:markdown_fenced_languages = [
\  'css',
\  'sh',
\  'erb=eruby',
\  'java',
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

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    execute "%! jq ."
endfunction

" ステータスラインに表示する情報の指定
" set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=%c\:%l/%L:

" ステータスラインの表示
" 参考URL
"   http://blog.ruedap.com/entry/20110712/vim_statusline_git_branch_name
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=%n  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%y    " バッファ内のファイルのタイプ
" set statusline+=%F    " バッファ内のファイルのフルパス
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}  " fencとffを表示
set statusline+=\     " 空白スペース
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
" set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\   " 空白スペース2個
" set statusline+=%{b:charCounterCount}
set statusline+=\|%P\|" ファイル内の何％の位置にあるか
" set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示

" ステータスラインの色
highlight StatusLine term=NONE cterm=NONE ctermfg=255 ctermbg=238

"-----------------------------------------------------
" タブ・インデント
"-----------------------------------------------------
" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使う
if expand("%:r") == 'Makefile'
  set noexpandtab
else
  set expandtab
endif
" インデントをオプションの'shiftwidth'の値の倍数に丸める
set shiftround
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
" set fileencoding=utf-8

"----------------------------------------------------
" clipboard
" よくわからない...
"----------------------------------------------------
"
" if has('unnamedplus')
"   set clipboard& clipboard+=unnamedplus
" else
"   set clipboard& clipboard+=unnamed,autoselect
" endif

if has("clipboard")
  vmap ,y "+y
  nmap ,p "+gP
  " exclude:{pattern} must be last ^= prepend += append
  " if has("gui_running") || has("xterm_clipboard")
  "   silent! set clipboard^=unnamedplus
  "   set clipboard^=unnamed
  " endif
  set clipboard+=unnamed ",autoselect
endif


"-----------------------------------------------------
" 矩形選択で連番入力
"-----------------------------------------------------

" 数字を選んで co と入力
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"-----------------------------------------------------
" プラグイン読み込み
"-----------------------------------------------------

let $PATH = "~/.pyenv/shims:".$PATH

if exists("$HOME/.config/nvim/plugins.vim")
  source $HOME/.config/nvim/plugins.vim
endif

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
