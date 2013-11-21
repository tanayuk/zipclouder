# Zipclouder

zipcloud API(http://zipcloud.ibsnet.co.jp/doc/api)用のRubyライブラリ

## Installation

Add this line to your application's Gemfile:

    gem 'zipclouder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zipclouder

## Usage

    Zipclouder.search(<郵便番号(ハイフンありも可)>)

### ex)

    zipclouder = Zipclouder.search(7830060)

    zipclouder.address
      #=> "高知県南国市蛍が丘"

    zipclouder.kana
      #=> "ｺｳﾁｹﾝﾅﾝｺｸｼﾎﾀﾙｶﾞｵｶ"

    zipclouder.pref_code
      #=> "39"

    zipclouder.zip_code
      #=> "7830060"

    zipclouder.success?
      #=> true / false 通信の成功・失敗

    zipclouder.error_message
      #=> "パラメータ「郵便番号」の桁数が不正です。"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
