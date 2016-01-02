# paperclip-upyun
[![RubyGems](https://img.shields.io/gem/dtv/paperclip-upyun.svg?style=flat)](https://rubygems.org/gems/upyun)
[![Build status](https://img.shields.io/badge/paperclip----upyun-passing-green.svg?style=flat)]()

This is a [Paperclip](https://github.com/thoughtbot/paperclip) plugin, which use [upyun](https://www.upyun.com/zh/index.html) stoage. 
 
Dependency [upyun-ruby](https://github.com/upyun/ruby-sdk) sdk.

## Install

`gem install paperclip-upyun`

or

`gem 'paperclip-upyun` in you Gemfile.


## Usage

* create `config/initializers/paperclip.rb` or your program initializer. code configation as follow:

```
Paperclip::Attachment.default_options[:storage] = :upyun
Paperclip::Attachment.default_options[:bucket] = ENV["UPYUN_BUCKET"]
Paperclip::Attachment.default_options[:operator] = ENV["UPYUN_OPERATOR"]
Paperclip::Attachment.default_options[:password] = ENV["UPYUN_PASSWORD"]
Paperclip::Attachment.default_options[:upyun_host] = ENV["UPYUN_HOST"]
Paperclip::Attachment.default_options[:use_timestamp] = false
```

* add paperclip config in your model:

```
class User < ActiveRecord::Base

  	has_attached_file :avatar,
                    :path => ":class/:attachment/:id/:fingerprint/:filename:version",
                    :default_url => ":upyun_host/:class/:attachment/default_avatar.png:version"

  	# validates :avatar, :attachment_presence => true
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end

```

* happy code with

	`User.avatar.url` or add `:version` parameter like `User.avatar.url(64)`
	
	
	
## About :version Parameter

* This gem use clip image function with upyun, default separator is `!`, more information you can see [http://docs.upyun.com/guide/#_9](http://docs.upyun.com/guide/#_9)
* if you do not want this function, just don't use :version parameter in :path model configration.

## Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## CHANGELOG 
###0.1.2(2016-1-3)
* perfect REAM.md
* fix require issue
* test passing

### 0.1.1 (2015-12-27)
* first version 


