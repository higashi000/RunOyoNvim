let s:save_cpo = &cpo
set cpo&vim

function! RunOyoVim#Tweet(tweetText)
ruby << RUBY
  require 'twitter'

  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = VIM.evaluate('g:consumer_key')
    config.consumer_secret = VIM.evaluate('g:consumer_secret')
    config.access_token = VIM.evaluate('g:access_token')
    config.access_token_secret = VIM.evaluate('g:access_token_secret')
  end

  @client.update(VIM.evaluate('a:tweetText'))
RUBY
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
