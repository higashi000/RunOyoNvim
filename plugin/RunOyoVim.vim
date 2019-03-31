let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* RunOyoTweet call RunOyoVim#Tweet(<f-args>)
command! -nargs=1 RunOyoSearch call RunOyoVim#Search(<f-args>)
command! -nargs=0 RunOyoTL call RunOyoVim#SeeTL()

let &cpo = s:save_cpo
unlet s:save_cpo
