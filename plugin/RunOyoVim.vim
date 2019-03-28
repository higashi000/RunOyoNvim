let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 RunOyoTweet call RunOyoVim#Tweet(<f-args>)
command! -nargs=0 RunOyoTL call RunOyoVim#SeeTL()

let &cpo = s:save_cpo
unlet s:save_cpo
