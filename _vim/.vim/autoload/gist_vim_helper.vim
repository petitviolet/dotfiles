" -------------------------------------------------------
" author  :nukino
" version :000
" license :BSD
" 変更履歴
" 12/01/13    新規作成
" -------------------------------------------------------
" %Y,%m,%dなどstrftime()の書式指定子を指定可能
" $f: ファイル名
" $d: ユーザー定義description
let g:gist_vim_helper_new_desc = get(g:, 'gist_vim_helper_new_desc', '')
let g:gist_vim_helper_edit_desc = get(g:, 'gist_vim_helper_edit_desc', '')

let s:bufprefix = 'gist' . (has('unix') ? ':' : '_')
let s:bufnamemx = '\m^' . s:bufprefix .'\zs\([0-9a-f]\+\)\ze$'

function! s:get_gist_info(gistid)
"gist.vimのs:GetGistFilenameを改変
  let url = 'https://gist.github.com/'.a:gistid
  let res = system('curl -s '.g:gist_curl_options.' '.url)
  let fname = matchstr(res, '\m^.*<a href="/raw/[^"]\+/\zs\([^"]\+\)\ze".*$')
  let sdesc = matchstr(res, '\m^.*<span id="description".\{-1,}>\zs\([^<]\+\)\ze</span>.*$')
  "echom "file:" . fname . " desc:" . sdesc
  if fname =~ '/'
    return ['',sdesc]
  else
    return [fname,sdesc]
  endif
endfunction

" descriptionを取得する
" is_edit: Gist edit状態？
func! s:get_description(is_edit)
  let sdesc = a:is_edit ? g:gist_vim_helper_edit_desc : g:gist_vim_helper_new_desc
  let fname = expand("%:t")
  let bef_desc = ''
  let is_rep_fname  = stridx( sdesc, '$f') >= 0
  let is_rep_desc   = stridx( sdesc, '$d') >= 0
  if ( a:is_edit && (is_rep_fname || is_rep_desc) )
    let [fname,bef_desc] = s:get_gist_info(matchstr(fname, s:bufnamemx))
  endif

  let sdesc = strftime( sdesc )
  if ( is_rep_fname )
    let sdesc = substitute( sdesc, '$f', fname, 'g' )
  endif
  if ( is_rep_desc )
    let usr_dsc = input( 'input user description:', bef_desc )
    let sdesc = substitute( sdesc, '$d', usr_dsc, 'g' )
  endif

  return sdesc
endfunc

func! s:cmd_exec(count, first, last, scmd)
  if ( a:count > 0 )
    if ( a:first == a:last )
      let scmd = a:count . a:scmd
    else
      let scmd = a:first . ',' . a:last . a:scmd
    endif
  else
    let scmd = a:scmd
  endif
  "echom "count: " . a:count . " first:" . a:first . " last:" . a:last . " cmd:" . scmd
  exe scmd
  return ""
endfunc

"edit update成功かどうか
func! s:is_update_edit(bufname)
  let gist_id = matchstr(a:bufname, s:bufnamemx)
  if ( gist_id == '' ) | return 0 | endif

  redir => smsgs
  silent messages
  redir END
  let msg_lst = split(smsgs, "\n")

  "messagesリストの末尾から3つ(数字に特に意味はない)検索して Done:http[s]://gist.～/gist_id
  "があるかどうかをみる
  let ii = len(msg_lst) - 1
  let ei = ii - 3
  "echo "ii:" . ii . " ei:" . ei . " gist_id:" . gist_id
  while (ii > ei && ii >= 0)
    if ( stridx(msg_lst[ii], "Edit Failed") >= 0 ) | return 0 | endif
    let res = matchstr(msg_lst[ii], '\mDone: http[s]*://gist.\+/\zs[0-9]\+\ze' )
    if ( res == gist_id ) | return 1 | endif
    let ii -= 1
  endwhile
  return 0
endfunc

" count     :コマンド実行回数？ -1の時全範囲。それ以外の時count==last
" arg1      :post type <0:private(-p) 0:default 1:public(-P)
func! gist_vim_helper#post_cmd(count, first, last,...)
  if !exists(':Gist')
    echohl ErrorMsg | echomsg "Please install gist.vim" | echohl None
    return
  endif

  let post_type   = get(a:, '1', 0)
  let scmd = "Gist "
  if ( post_type < 0 )      | let scmd .= '-p'
  elseif ( post_type > 0 )  | let scmd .= '-P' | endif
  let sdesc = s:get_description(0)
  if ( sdesc != '' ) | let scmd .= ' -s ' . sdesc | endif

  return s:cmd_exec(a:count, a:first, a:last, scmd)
endfunc

" count     :コマンド実行回数？ -1の時全範囲。それ以外の時count==last
" arg1      :post type <0:private(-p) 0:default 1:public(-P)
" arg2      :buffer close?
func! gist_vim_helper#edit_cmd(count, first, last,...)
  if !exists(':Gist')
    echohl ErrorMsg | echomsg "Please install gist.vim" | echohl None
    return
  endif

  "arg1が'a1 a2'と渡された場合にも対応
  let arg_lst = split(get(a:, '1', 0), ' ')
  let arg_lst_len = len(arg_lst)
  let post_type = arg_lst_len > 0 ? arg_lst[0] : 0
  let is_close  = arg_lst_len > 1 ? arg_lst[1] : get(a:, '2', 0)
  "echo "post_type:" . post_type . " is_close:" . is_close

  let scmd = "Gist -e"
  let sdesc = s:get_description(1)
  if ( sdesc != '' ) | let scmd .= ' -s ' . sdesc | en

  let l:ret = s:cmd_exec(a:count, a:first, a:last, scmd)
  if ( is_close && s:is_update_edit(bufname("%")))
    redraw
    setlocal nomodified
    exe "close!"
  endif
  return l:ret
endfunc

" count     :コマンド実行回数？ -1の時全範囲。それ以外の時count==last
" arg1      :post type <0:private(-p) 0:default 1:public(-P)
" arg2      :buffer close?
func! gist_vim_helper#auto_cmd(count, first, last,...)
  let bufname = bufname("%")

  if ( bufname =~ s:bufnamemx )
    return gist_vim_helper#edit_cmd(a:count, a:first, a:last, get(a:,'1',0), get(a:,'2',0))
  else
    return gist_vim_helper#post_cmd(a:count, a:first, a:last, get(a:,'1',0))
  endif
endfunc

func! gist_vim_helper#post(is_private) range
  if ( a:firstline == a:lastline )
    " Visual mode以外ではa:firstline a:lastlineは共に現在の行となるみたい
    " 厳密には最終行を求めるべきだが、count<=0の場合無視される構造なのでこ
    " のまま渡す
    return gist_vim_helper#post_cmd(-1, 1, a:lastline, a:is_private)
  else
    return gist_vim_helper#post_cmd(a:lastline, a:firstline, a:lastline, a:is_private)
  endif
endfunc

func! gist_vim_helper#edit(is_private, is_close) range
  if ( a:firstline == a:lastline )
    return gist_vim_helper#edit_cmd(-1, 1, a:lastline, a:is_private, a:is_close)
  else
    return gist_vim_helper#edit_cmd(a:lastline, a:firstline, a:lastline, a:is_private, a:is_close)
  endif
endfunc

func! gist_vim_helper#auto(is_private, is_close) range
  if ( a:firstline == a:lastline )
    return gist_vim_helper#auto_cmd(-1, 1, a:lastline, a:is_private, a:is_close)
  else
    return gist_vim_helper#auto_cmd(a:lastline, a:firstline, a:lastline, a:is_private, a:is_close)
  endif
endfunc

