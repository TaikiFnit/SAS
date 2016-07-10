# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter/bootswatch/rails/helpers/version'

Gem::Specification.new do |gem|
  gem.name          = 'twitter-bootswatch-rails-helpers'
  gem.version       = Twitter::Bootswatch::Rails::Helpers::VERSION
  gem.required_ruby_version = '>= 1.9.3'
  gem.required_rubygems_version = '>= 1.8.11'
  gem.authors       = ['scottvrosenthal']
  gem.email         = ['sr7575@gmail.com']
  gem.homepage      = 'https://github.com/scottvrosenthal/twitter-bootswatch-rails-helpers'
  gem.summary       = %q{Bootswatch Rails Helpers gem for use with the twitter-bootswatch-rails & less-rails gems}
  gem.description   = %q{twitter-bootswatch-rails-helpers gem provides common view helpers for use with the twitter-bootswatch-rails & less-rails gems}
  gem.license       = 'MIT'
  gem.licenses      = ['MIT', 'GPL-2']

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency     'twitter-bootswatch-rails', '~> 3.3', '>= 3.3.2'

end
