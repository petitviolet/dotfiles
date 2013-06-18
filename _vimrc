"""""""""""""""""""""""""""""""""""""""""
"                          #
"                        ###
"                    #######
"                 ##########
"            ##########
"           ########
"               ###
"                   ####   #
"                       ####
"                          #
"           #              #
"           ################    ####
"           ################    ####
"           ################     ##
"           #              #
"           ################
"           ################
"           ################
"                         #
"           ################
"           ################
"           ##############
"                        ##
"           #            ###
"           ################
"           ###############
"           #
"           #              #
"           ################
"           ################
"           ################
"                       ##
"                        ##
"                      #####
"                     ######
"                     #####
"
"                #####
"             ###########
"            ##############
"           ##           ##
"           #              #
"           #              #
"           #             ##
"            #          ###
"             ##
"
"
"-----------------------------------------------------
" 基本的な設定
"-----------------------------------------------------

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
"let mapleader = ","
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

" 矩形選択で連番入力
" 数字を選んで co と入力
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"-----------------------------------------------------
" キーバインド変更
"-----------------------------------------------------
" map CTRL-E to end-of-line (insert mode)
imap  <C-e> <End>
" map CTRL-A to beginning-of-line (insert mode)
" imap  <C-a> <Home>
imap  <C-a> <esc>^i
imap  <C-w> <esc>bcw
imap  <C-b> <Left>
imap  <C-f> <Right>
imap  <C-u> <C-u><C-o>d0
imap  <C-x> <esc>xi
imap  <C-n> <Down>
imap  <C-p> <Up>
imap  <C-d> <Del>
imap  <C-k> <C-o>d$
map   <C-j> <C-w>p
map  % <C-o>:%s/
"
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


" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=%c\:%l/%L\|%P\|
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
nnoremap <C-k> :Texplore<Return>
nnoremap <C-l> :tabnext<Return>
nnoremap <C-h> :tabprevious<Return>

" set clipboard+=unnamed
set clipboard+=unnamedplus,unnamed
" set clipboard+=autoselect

filetype on

filetype plugin on

"-----------------------------------------------------
" Plugins
"-----------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundle 'altercation/vim-colors-solarized'

" neocomplcache
Bundle 'Shougo/neocomplcache'
set completeopt=menuone
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
" 文字deleteのさくさく化
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" C-u uで現在開いているファイルと同ディレクトリのファイルを開く
" C-u iでunite経由で既に開いたファイルを開く
" C-u cで最初に開いたファイルのディレクトリのファイルを開く
" C-u r よく分からない

Bundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
nnoremap [unite] <Nop>
nmap <space>u [unite]
nnoremap <silent> [unite]u :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]i :<C-u>Unite -buffer-name=files buffer_tab<CR>
" nnoremap <silent> [unite]g :<C-u>Unite vcs_grep/git<CR>
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

Bundle 'Shougo/vimfiler'
" space-eでウィンドウ左側にファイルツリー表示
nnoremap <silent> <space>e :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>
Bundle 'h1mesuke/unite-outline'
Bundle 'tsukkee/unite-help'
Bundle 'sgur/unite-git_grep'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'kana/vim-fakeclip'

" ファイル管理(tree表示)
" \nでファイルツリー表示
Bundle 'scrooloose/nerdtree'
nmap <Leader>n :NERDTreeToggle<CR>

" Undo関係
" undoの履歴を残せる
" 既に編集し終わったファイルでもuで遡れる
set undodir=~/.vimundo
set undofile
if has('persistent_undo')
  set undodir=./.vimundo,~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif
" UndoTree
" \uで開く
Bundle 'mbbill/undotree'
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitLocation = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

" YankRing.vim
Bundle 'YankRing.vim'
" , y でヤンク履歴
" pでペーストした後，C-p,C-nで過去のものに切り替わっていく
nmap ,y :YRShow<CR>

"-----------------------------------------------------
" インデントの可視化
"-----------------------------------------------------
" set list
" set listchars=eol:\ ,trail:-
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" インデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

Bundle 'Yggdroot/indentLine'
let g:indentLine_enabled=1
let g:indentLine_color_term=200
let g:indentLine_loaded = 1
let g:indentLine_char = ">"

"-----------------------------------------------------
" 文法チェック
"-----------------------------------------------------
Bundle 'mitechie/pyflakes-pathogen'
" nnoremap <leader>l :<C-u>call Flake8()<CR>


"-----------------------------------------------------
" jedi-vimの設定
"-----------------------------------------------------
" Bundle 'davidhalter/jedi-vim'
" function! InitPython()
"     " jedi.vimとpyhoncompleteがバッティングし得るらしいので
"     " http://mattn.kaoriya.net/software/vim/20121018212621.htm
"     let b:did_ftplugin = 1
"
"     setlocal commentstring=#%s
"
"     " rename用のマッピングを無効にしたため、代わりにコマンドを定義
"     command! -nargs=0 JediRename :call jedi#rename()
"
"     " markdownはインベント幅4,タブ幅8でスペースを使う
"     " http://d.hatena.ne.jp/over80/20090305/1236264851
"     " setlocal shiftwidth=4
"     " setlocal tabstop=8
"     " setlocal softtabstop=4
"     " setlocal expandtab
"     "
"     " setlocal autoindent
"     " setlocal smartindent
"     setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
"
"
"     " IndentGuidesEnable
" endfunction
" autocmd BufEnter * if &filetype == 'python' | call InitPython() | endif
"
" " pythonのrename用のマッピングがquickrunとかぶるため回避させる
" let g:jedi#rename_command = '<Leader><C-r>'
" let g:jedi#pydoc = '<Leader>k'
"
" " let g:jedi#auto_initialization = 1
" " let g:jedi#rename_command ='<C-e>'
" " let g:jedi#popup_on_dot = 1
" autocmd FileType python let b:did_ftplugin = 1

Bundle 'vim-scripts/pythoncomplete'
autocmd FileType python set omnifunc=pythoncomplete#Complete

"-----------------------------------------------------
" zen-coding設定
"-----------------------------------------------------
Bundle 'mattn/zencoding-vim'
let g:user_zen_settings = {
      \  'lang' : 'ja',
      \  'indentation' : '  ',
      \  'html' : {
      \    'filters' : 'html',
      \    'snippets' : {
      \      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\n<script>\n\\$(function() {\n\t|\n})()\n</script>",
      \      'jqui' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js\"></script>\n<link type=\"css/text\" href=\"https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/ui-lightness/jquery-ui.css\" rel=\"stylesheet\" />",
      \      'cd' : "<![CDATA[|]]>",
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
Bundle 'open-browser.vim'
Bundle 'mattn/webapi-vim'
Bundle 'tell-k/vim-browsereload-mac'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'taichouchou2/html5.vim'
Bundle 'taichouchou2/vim-javascript'
" Bundle 'pangloss/vim-javascript'
Bundle 'JavaScript-syntax'

autocmd FileType html : setlocal indentexpr=""
autocmd FileType javascript :compiler gjslint
autocmd QuickFixCmdPost make copen
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" quick run
Bundle 'thinca/vim-quickrun'
nmap <space>r <plug>(quickrun)

filetype on
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"-----------------------------------------------------
" GIST.vim の設定 実行は :Gist
" :Gist -l でgist一覧
" :Gist -s hoge でタイトル付きで投稿
"-----------------------------------------------------

Bundle 'mattn/gist-vim'
let g:github_user = 'usrename'
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
" txtファイルのカラーリング
Bundle 'vim-scripts/HybridText'
" autocmd BufEnter * if &filetype == "text" | setlocal ft=hybrid | endif
au BufRead,BufNewFile *.txt set syntax=hybrid
"-----------------------------------------------------
" 文字コードの自動認識
"-----------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
" if has('iconv')
"   let s:enc_euc = 'euc-jp'
"   let s:enc_jis = 'iso-2022-jp'
"   " iconvがeucJP-msに対応しているかをチェック
"   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'eucjp-ms'
"     let s:enc_jis = 'iso-2022-jp-3'
"   " iconvがJISX0213に対応しているかをチェック
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

" 以下は最後に書くと機能するっぽい
" 改行コードの自動認識
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
