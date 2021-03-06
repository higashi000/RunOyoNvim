let s:save_cpo = &cpo
set cpo&vim

function! RunOyoNvim#Tweet(...)
let l:tweetText = ""

if a:0 == 1
  let argumentList = a:000
  let l:tweetText = argumentList[0]
elseif a:0 == 2
  let argumentList = a:000
  let l:tweetText = argumentList[0] . " " . argumentList[1]
endif

let g:ending = get(g:, 'ending', '')
ruby << RUBY
  require 'twitter'

  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = VIM.evaluate('g:consumer_key')
    config.consumer_secret = VIM.evaluate('g:consumer_secret')
    config.access_token = VIM.evaluate('g:access_token')
    config.access_token_secret = VIM.evaluate('g:access_token_secret')
  end

  @client.update(VIM.evaluate('l:tweetText') + VIM.evaluate('g:ending'))
RUBY
endfunction

function! RunOyoNvim#GetTL()
ruby << RUBY
require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key = VIM.evaluate('g:consumer_key')
  config.consumer_secret = VIM.evaluate('g:consumer_secret')
  config.access_token = VIM.evaluate('g:access_token')
  config.access_token_secret = VIM.evaluate('g:access_token_secret')
end

@client.home_timeline.each do |tweet|
  print tweet.user.name + "\n"
  print tweet.user.screen_name + "\n"
  print tweet.text + "\n"
  print "\n" + "--------------------------" + "\n\n"
end
RUBY
redir END
endfunction

function! RunOyoNvim#WordSearch(keyWord)
ruby << RUBY
require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key = VIM.evaluate('g:consumer_key')
  config.consumer_secret = VIM.evaluate('g:consumer_secret')
  config.access_token = VIM.evaluate('g:access_token')
  config.access_token_secret = VIM.evaluate('g:access_token_secret')
end

@client.search(VIM.evaluate('a:keyWord'), :count => 25).map do |tweet|
  print tweet.user.name + "\n"
  print tweet.user.screen_name + "\n"
  print tweet.text + "\n"
  print "\n" + "--------------------------" + "\n\n"
end
RUBY
endfunction

function! RunOyoNvim#SeeTL()
  e ~/.TL.txt
  let outputfile = "$HOME/.TL.txt"
  execute ":redir!>".outputfile
    silent! call RunOyoNvim#GetTL()
  redir END
  checktime
endfunction

function! RunOyoNvim#Search(keyWord)
  e ~/.Search.txt
  let outputfile = "$HOME/.Search.txt"
  execute ":redir!>" . outputfile
    silent! call RunOyoNvim#WordSearch(a:keyWord)
  redir END
  checktime
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
