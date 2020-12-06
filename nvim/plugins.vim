"-----------------------------------------------------
    "
  "                                 ___
"      ___            ___        /  /\
"     /  /\          /__/\      /  /::|
"    /  /:/          \__\:\    /  /:|:|
"   /  /:/           /  /::\  /  /:/|:|__
"  /__/:/  ___    __/  /:/\/ /__/:/_|::::\
"  |  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/
"  |  |:|/  /:/  \  \::/           /  /:/
"  |__|:|__/:/    \  \:\          /  /:/
"   \__\::::/      \__\/         /__/:/
"       ~~~~                     \__\/
"                    ___       ___           ___                        ___
"      ___          /  /\     /  /\         /  /\           ___        /  /\
"     /  /\        /  /:/    /  /:/        /  /::\         /__/\      /  /::|
"    /  /::\      /  /:/    /  /:/        /  /:/\:\        \__\:\    /  /:|:|
"   /  /:/\:\    /  /:/    /  /:/        /  /:/  \:\       /  /::\  /  /:/|:|__
"  /  /::\ \:\  /__/:/    /__/:/     /\ /__/:/_\_ \:\   __/  /:/\/ /__/:/ |:| /\
" /__/:/\:\_\:\ \  \:\    \  \:\    /:/ \  \:\__/\_\/  /__/\/:/~~  \__\/  |:|/:/
" \__\/  \:\/:/  \  \:\    \  \:\  /:/   \  \:\ \:\    \  \::/         |  |:/:/
"      \  \::/    \  \:\    \  \:\/:/     \  \:\/:/     \  \:\         |__|::/
"       \__\/      \  \:\    \  \::/       \  \::/       \__\/         /__/:/
"                   \__\/     \__\/         \__\/                      \__\/
"
" gocode
set rtp+=$GOROOT/misc/vim
" golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

set nocompatible               " be iMproved
filetype off                   " required!


" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
" call dein#begin(s:dein_dir)

" プラグインリストを収めた TOML ファイル
let s:toml      = '~/.config/nvim/rc/dein.toml'
let s:lazy_toml = '~/.config/nvim/rc/dein_lazy.toml'
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_cache = g:cache_home . '/.dein'

" TOML を読み込み、キャッシュしておく
if dein#load_state(s:dein_cache)
  call dein#begin(s:dein_cache)

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

function! s:source_rc(path) abort
  execute 'source' fnameescape(expand('~/.config/nvim/rc/' . a:path))
endfunction

call s:source_rc('plugins.rc.vim')

" 設定終了
" call dein#end()

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

nnoremap <space>d :call dein#update()<CR>
