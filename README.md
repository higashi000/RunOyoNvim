# RunOyoVim

## install
- dein
```
[[plugins]]
repo = 'higashi000/RunOyoVim'
```

## Initial setting
- 下記の設定を`init.vim`に記述するか書いたファイルをinit.vimで読み込んでください
```vimscript
let g:consumer_key = "Your Consumer key"
let g:consumer_secret = "Your Consumer key secret"
let g:access_token = "Your Access token"
let g:access_token_secret = "Your Access token secret"
```

- 以下のライブラリをインストールしてください
  - Twitter Ruby Gem
  - neovim ruby host

## How to use
- Tweet
```
:RunOyoTweet `ツイート内容`
```

- TLの取得
```
:RunOyoTL
```

- ワード検索
```
:RunOyoSearch `検索ワード`
```
