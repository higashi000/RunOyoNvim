let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* RunOyoTweet call RunOyoNvim#Tweet(<f-args>)
command! -nargs=1 RunOyoSearch call RunOyoNvim#Search(<f-args>)
command! -nargs=0 RunOyoTL call RunOyoNvim#SeeTL()

let &cpo = s:save_cpo
unlet s:save_cpo
