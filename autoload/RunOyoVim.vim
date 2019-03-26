let s:save_cpo = &cpo
set cpo&vim

function! RunOyoVim#Tweet(tweetText)
  echo a:tweetText
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
