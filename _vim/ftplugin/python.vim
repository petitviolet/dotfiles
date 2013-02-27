"行頭の余白内でTabを打ち込むと'shiftwidth'の数だけインデントする
setlocal smarttab

"-----------------------------------------------------
" タブ
"-----------------------------------------------------
" タブが対応する空白の数
setlocal tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
setlocal softtabstop=4
" インデントの各段階に使われる空白の数
setlocal shiftwidth=4
" タブを挿入するとき、代わりに空白を使う
setlocal expandtab
" インデントをオプションの'shiftwidth'の値の倍数に丸める
setlocal shiftround

setlocal textwidth=80

"-----------------------------------------------------
" インデント
"-----------------------------------------------------
" オートインデントを有効にする
setlocal autoindent
" 新しい行を作ったときに高度な自動インデントを行う。 'cindent'
" がオンのときは、'smartindent' をオンにしても効果はない。
setlocal nosmartindent
" Cプログラムファイルの自動インデントを始める。
setlocal cindent

setlocal colorcolumn=80

"-----------------------------------------------------
" 文法チェック
"-----------------------------------------------------

let pyflakes_use_quickfix = 0

