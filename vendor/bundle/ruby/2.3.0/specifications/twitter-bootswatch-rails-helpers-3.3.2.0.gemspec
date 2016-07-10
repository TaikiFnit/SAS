# -*- encoding: utf-8 -*-
# stub: twitter-bootswatch-rails-helpers 3.3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "twitter-bootswatch-rails-helpers"
  s.version = "3.3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.11") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["scottvrosenthal"]
  s.date = "2015-02-16"
  s.description = "twitter-bootswatch-rails-helpers gem provides common view helpers for use with the twitter-bootswatch-rails & less-rails gems"
  s.email = ["sr7575@gmail.com"]
  s.homepage = "https://github.com/scottvrosenthal/twitter-bootswatch-rails-helpers"
  s.licenses = ["MIT", "GPL-2"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "Bootswatch Rails Helpers gem for use with the twitter-bootswatch-rails & less-rails gems"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<twitter-bootswatch-rails>, [">= 3.3.2", "~> 3.3"])
    else
      s.add_dependency(%q<twitter-bootswatch-rails>, [">= 3.3.2", "~> 3.3"])
    end
  else
    s.add_dependency(%q<twitter-bootswatch-rails>, [">= 3.3.2", "~> 3.3"])
  end
end
