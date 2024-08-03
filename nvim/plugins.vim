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

" Automatically install vim-plug if absent
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

" call :PlugInstall automatically if missing packages found
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \| PlugInstall --sync | source $HOME/.config/nvim/init.vim
" \| endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Plug 'Shougo/dein.vim'
" Plug 'gmarik/vundle'
" Plug 'mattn/sonictemplate-vim'
" Plug 'scrooloose/syntastic'

Plug 'nathanaelkane/vim-indent-guides'

" Plug 'Shougo/tabpagebuffer.vim'
" Plug 'Shougo/vimfiler'
Plug 'rking/ag.vim'
Plug 'tyru/caw.vim'
Plug 'thinca/vim-qfreplace'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
" Plug 'kana/vim-fakeclip'
Plug 'mbbill/undotree'
" Plug 'YankRing.vim'
Plug 'LeafCage/yankround.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
" Plug 'mattn/webapi-vim'
Plug 'Konfekt/FastFold'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" vim-lsp and completions
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'Shougo/unite.vim' ", { 'on': 'Unite' }
Plug 'Shougo/neomru.vim' ", { 'on': 'Unite' }
Plug 'lambdalisue/unite-grep-vcs', { 'on': 'Unite' }
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'thinca/vim-quickrun', { 'on': 'QuickRun' }
Plug 'Shougo/vimproc.vim' ", { 'on': 'QuickRun', 'build': 'make' }
Plug 'kannokanno/previm', { 'on': 'Previm' }

" Language specific plugins
" Plug 'elmcast/elm-vim', { 'for': 'elm' }
" Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
" Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
" Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" 
" Plug 'alfredodeza/khuno.vim', { 'for': ['python', 'python3'] }
" Plug 'vim-scripts/indentpython.vim', { 'for': ['python', 'python3'] }
" Plug 'lambdalisue/vim-django-support', { 'for': ['python', 'python3'] }
" Plug 'mjbrownie/django-template-textobjects', { 'for': ['python', 'python3'] }
" Plug 'kana/vim-textobj-user', { 'for': ['python', 'python3'] }
" Plug 'lambdalisue/vim-pyenv', { 'for': ['python', 'python3'] }
" Plug 'davidhalter/jedi-vim', { 'for': ['python', 'python3'] }
" Plug 'mattn/emmet-vim', { 'for': 'html' }
" Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css'] }
" Plug 'pangloss/vim-javascript', { 'for': ['html', 'css', 'javascript'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'css', 'javascript'] }
" Plug 'leafgarland/typescript-vim', { 'for': ['ts','tsx', 'typescript', 'typescript.jsx'] }
" Plug 'peitalin/vim-jsx-typescript', { 'for': ['ts','tsx', 'typescript', 'typescript.jsx'] }
" Plug 'vim-latex/vim-latex', { 'for': 'tex' }
" Plug 'gre/play2vim', { 'for': 'scala' }
" Plug 'dag/vim2hs', { 'for': 'haskell' }
" Plug 'eagletmt/unite-haddock', { 'for': 'haskell' }
" Plug 'ujihisa/neco-ghc', { 'for': 'haskell' }
" Plug 'ujihisa/unite-haskellimport', { 'for': 'haskell' }
" Plug 'wlangstroth/vim-racket', { 'for': ['rkt', 'racket'] }
" Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
" Plug 'bbatsov/rubocop', { 'for': 'ruby' }
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
" Plug 'tpope/vim-bundler', { 'for': 'ruby' }

" Plug 'Shougo/deoplete.nvim'
" Plug 'ujihisa/neco-look'
" Plug 'Shougo/neocomplete'
"
" Plug 'Shougo/neco-syntax'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'roxma/nvim-yarp'

" no support by LSP on markdown
Plug 'superbrothers/vim-quickrun-markdown-gfm', { 'for': ['md', 'markdown'] }
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'hashivim/vim-terraform', { 'for': ['md', 'markdown', 'terraform'] }

" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'udalov/kotlin-vim', { 'for': ['kt', 'kotlin'] }

call plug#end()


" --------------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

"-----------------------------------------------------
" Python preparation
"-----------------------------------------------------
" ~/.pyenv/shims を $PATH に追加する
" これを行わないとpythonが正しく検索されない
" call s:IncludePath(expand("~/.pyenv/shims"))
" let $PATH = "~/.pyenv/shims:".$PATH
set pyxversion=3
let g:python_host_prog=$PYENV_ROOT.'/versions/neovim-2/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'
" let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
" let g:python_host_prog = $PYENV_ROOT . '/shims/python2'
set encoding=utf-8


"-----------------------------------------------------
" 文法チェック
"-----------------------------------------------------
" set makeprg=sbtc\ --exec\ compile

" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=2
" let g:syntastic_mode_map = {
      " \ 'mode': 'passive',
      " \ 'active_filetypes': ['javascript', 'json', 'ruby', 'php', 'python'],
      " \ 'passive_filetypes': ['java', 'scala', 'python'],
      " \}
" function! s:syntastic()
  " w
  " SyntasticCheck
" endfunction
" nmap <Leader>S :SyntasticCheck<CR>

"-----------------------------------------------------
" 表示関係
"-----------------------------------------------------

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" インデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
autocmd VimEnter,Colorscheme * :hi Normal ctermbg=234

" HybridText
" txtファイルのカラーリング
" au BufRead,BufNewFile *.txt set syntax=hybrid

vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_popup = 1


"-----------------------------------------------------
" lsp
"-----------------------------------------------------
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('/tmp/vim-lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"<buffer>
set completeopt=menuone,noinsert,noselect,preview
" let g:lsp_text_edit_enabled = 1


"-------------
" multiple-cursor with neocomplete
"-------------
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"--------------------------------------------------
" Incsearch
"--------------------------------------------------
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

"--------------------------------------------------
" English
"--------------------------------------------------

" set completeopt=menuone

"--------------------------------------------------
" unite.vim
"--------------------------------------------------
" C-u u 現在開いているファイルと同ディレクトリのファイルを開く
" C-u i unite経由で既に開いたファイルを開く
" C-u c 最初に開いたファイルのディレクトリのファイルを開く
" C-u r 編集履歴

let g:unite_enable_start_insert=1
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
nnoremap [unite] <Nop>
nmap <space>u [unite]
nnoremap <silent> [unite]u :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]i :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite buffer<CR>
" nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=files buffer_tab<CR>
" nnoremap <silent> [unite]g :<C-u>Unite grep/git:/<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep/git:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]h  :<C-u>Unite grep/git:. -buffer-name=search-buffer<CR><C-r><C-w><CR>
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>


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

" autocmd BufEnter,BufWinEnter \[unite\]* highlight! link CursorLine PmenuSel
autocmd BufLeave \[unite\]* highlight! link CursorLine NONE

"--------------------------------------------------
" Utility
"--------------------------------------------------
" <Leader>cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

function! Toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    copen
  endif
endfunction

" <Leader>qでquickfixウィンドウをtoggleする
nnoremap <Leader>q :call Toggle_quickfix_window()<CR>

"--------------------------------------------------
" IDEっぽいやつ
"--------------------------------------------------

" TagBar
" tbでIDEっぽくなる
nmap <space>tb :TagbarToggle<CR>
" autocmd VimEnter * nested :call tagbar#autoopen(1)

let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1

"" TagBarのcolor
autocmd VimEnter,Colorscheme * :hi TagbarSignature ctermfg=250 " ctermbg=240
autocmd VimEnter,Colorscheme * :hi TagbarVisibilityPublic ctermfg=154 " ctermbg=240
autocmd VimEnter,Colorscheme * :hi TagbarVisibilityPrivate ctermfg=160 " ctermbg=240

" tag jump
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle list --paths` 2>/dev/null"
let g:vim_tags_auto_generate = 1
" 候補が複数ある時にそれを表示
set notagbsearch
" nnoremap <C-t> :exe("tjump ".expand('<cword>'))<CR>
" autocmd FileType * nnoremap <C-t> g<C-]>
autocmd FileType bib,tex nnoremap <C-t> vi}g<C-]>
nnoremap <silent> tn :tag<CR>
nnoremap <silent> tb :pop<CR>
set tags=./tags;$HOME;

nnoremap TT :TagsGenerate!<CR>


" nerdtree
" ファイル管理(tree表示)
" \nでファイルツリー表示
nmap <silent> <Leader>e :NERDTreeToggle<CR>
" vmap <silent> <Leader>e <Esc> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" focus on current buffer file
map <leader>r :NERDTreeFind<cr>

" function s:MoveToFileAtStart()
"   call feedkeys("\<C-w>l")
" endfunction
" autocmd VimEnter *  NERDTree | call s:MoveToFileAtStart()
" autocmd VimEnter * wincmd p

let NERDTreeShowHidden=1


" UndoTree
" \uで開く
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

if has('persistent_undo')
  set undodir=$HOME/.vim/undodir/
  set undofile
endif

" YankRing.vim
" pでペーストした後，C-p,C-nで過去のものに切り替わっていく
" <Leader>y でヤンク履歴
" nmap <Leader>y :YRShow<CR>

" Yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)



" vim surrond
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
" For Pythonプラグイン
"-----------------------------------------------------
" PATHの自動更新関数
" | 指定された path が $PATH に存在せず、ディレクトリとして存在している場合
" | のみ $PATH に加える
function s:IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction

" エラーチェック
let g:khuno_ignore="E113,E123,E126,E127,E128,E251,E302,E501,E502"
nmap <silent><Leader>xs <Esc>:Khuno show<CR>
nmap <silent><Leader>xon <Esc>:Khuno on<CR>
nmap <silent><Leader>xoff <Esc>:Khuno off<CR>

" " if dein#tap("jedi-vim")
"   " jediにvimの設定を任せると'completeopt+=preview'するので
"   " 自動設定機能をOFFにし手動で設定を行う
"   let g:jedi#auto_vim_configuration = 0
"   " let g:jedi#show_function_definition = 0
"   let g:jedi#show_call_signatures = 0
"   " <Leader>rでリネームする
"   let g:jedi#rename_command = '<Leader>r'
"   command! -nargs=0 JediRename :call jedi#rename()
"   let g:jedi#documentation_command = '<Leader>k'
"   autocmd FileType python setlocal omnifunc=jedi#completions
"   if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
"   endif
"   let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"   " 補完の最初の項目が選択された状態だと使いにくいためオフにする
"   let g:jedi#popup_select_first = 0
"   let g:jedi#popup_on_dot = 0
" " endif
" 
" autocmd FileType python let b:did_ftplugin = 1
" 
"-----------------------------------------------------
" emmet
"-----------------------------------------------------
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
" html, css, javascript関係
"-----------------------------------------------------
autocmd FileType javascript :compiler gjslint
" autocmd QuickFixCmdPost make copen
let g:netrw_nogx = 1 " disable netrw's gx mapping.

"-----------------------------------------------------
" Quick Run
"-----------------------------------------------------
nmap <space>r :QuickRun <CR>
" nmap <space>r <plug>(quickrun)
" nmap <space>r :<C-u>QuickRun <CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
" 読み込めない...
let g:quickrun_config = get(g:, 'quickrun_config', {})

let g:quickrun_config._ = {
      \ 'runner' : 'vimproc',
      \ 'runner/vimproc/updatetime' : 30,
      \ 'outputter/buffer/split' : 'botright 8sp',
      \ 'outputter' : 'quickfix',
      \ }
let g:quickrun_config.racket = {'command': 'racket'}
" markdownファイルをブラウザで開く
let g:quickrun_config['markdown'] = {
    \ 'outputter': 'browser',
    \ }

"-----------------------------------------------------
" GIST.vim の設定 実行は :Gist
"-----------------------------------------------------

let g:github_user = 'usrename'
let g:github_token = 'token'
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

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


" airblade/vim-gitgutter
" nnoremap [gitgutter] <Nop>
" nmap <C-h> [gitgutter]
" nmap [gitgutter]j <Plug>GitGutterNextHunk
" nmap [gitgutter]k <Plug>GitGutterPrevHunk
" nmap [gitgutter]u <Plug>GitGutterUndoHunk

" tpope/vim-fugitive
nmap Gd :Gdiff<CR>
nmap dg :diffget<CR>
nmap dp :diffput<CR>
"-----------------------------------------------------
" latex
"-----------------------------------------------------

" if dein#tap('vim-latex')
"   imap <C-i> <Plug>IMAP_JumpForward
"   " set conceallevel=0
"   let g:tex_conceal=""
"   let tex_flavor = 'latex'
"   set grepprg=grep\ -nH\ $*
"   set shellslash
"   "Macの人はデフォルトでpdfなので必要ない その他のOSの人はデフォルトがdviなので必要
"   let g:Tex_DefaultTargetFormat='pdf'
"   let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"   let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"   let g:Tex_FormatDependency_pdf = 'dvi,pdf'
" endif

"-----------------------------------------------------
" LSP
"-----------------------------------------------------
let g:lsp_auto_enable = 1
let g:lsp_signs_enabled = 1         " enable diagnostic signs / we use ALE for now
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✖'}
let g:lsp_signs_warning = {'text': '~'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_signs_information = {'text': '!!'}
let g:lsp_async_completion = 1

let g:lsp_diagnostics_enabled = 0
" debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.vim/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/.vim/asyncomplete.log')

" ruby
if executable('solargraph')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif
let g:LanguageClient_serverCommands = {
        \ 'ruby': ['solargraph', 'stdio'],
        \ }


"-----------------------------------------------------
" golang
"-----------------------------------------------------

let g:go_fmt_command = "goimports"

"-----------------------------------------------------
" Scala
"-----------------------------------------------------

"-----------------------------------------------------
" Haskell
"-----------------------------------------------------

let g:haskell_conceal_wide = 0
let g:haskell_conceal              = 0
let g:haskell_conceal_enumerations = 0
set foldlevelstart=99
set foldlevel=99

"-----------------------------------------------------
" markdown
"-----------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open'

let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'js=javascript', 'ruby', 'java', 'json']

"-----------------------------------------------------
" ファイルタイププラグインおよびインデントの有効化
filetype plugin indent on
