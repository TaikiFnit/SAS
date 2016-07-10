# Bootswatch Rails 3.3.2 Helpers gem


[![Build Status](https://travis-ci.org/scottvrosenthal/twitter-bootswatch-rails-helpers.png?branch=master)](https://travis-ci.org/scottvrosenthal/twitter-bootswatch-rails-helpers)

  - Requires [twitter-bootswatch-rails](https://github.com/scottvrosenthal/twitter-bootswatch-rails/)
  - Provides rails view helpers for [Twitter Bootstrap](http://getbootstrap.com/) alerts and breadcrumbs

## Installing Gem

Add this line to your application's Gemfile:

    gem 'twitter-bootswatch-rails', '~> 3.3.2'

    gem 'twitter-bootswatch-rails-helpers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitter-bootswatch-rails-helpers


## Usages

Flashes:

```ruby
def index
  # alert-warning
  flash[:warning] = "Test warning flash" # or flash[:default]

  # alert-warning
  flash[:default] = %Q{<strong>Warning</strong> This <a href="#" class="alert-link">alert</a> needs your attention, but it's not super important.}.html_safe

  # alert-success
  flash[:notice] = "Test warning flash" # or flash[:success]

  # alert-info
  flash[:info] = "Test info flash"

  # alert-danger
  flash[:error] = "Test error flash" # or flash[:alert]

end

```
The view helper then loops through current flash object:

```erb
  <%= bootswatch_flash %>
```

Alerts:

For manual alerts that don't use the flash object:

```erb
<%= bootswatch_flash_container(:default, true) do %>
  <h4>Alert block</h4><p>Best check yo self, you're not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
<% end %>
<%= bootswatch_flash_container(:success) do %>
  <strong>Success</strong> You successfully read this important alert message.
<% end %>
<%= bootswatch_flash_container(:error) do %>
  <strong>Error</strong> Change a few things up and try submitting again.
<% end %>
<%= bootswatch_flash_container(:info) do %>
  <strong>Information</strong> This <a href="#" class="alert-link">alert</a> needs your attention, but it's not super important.
<% end %>
```

Breadcrumbs:

Place an add_breadcrumb call in the action of your controller:

```ruby
def index
  add_breadcrumb I18n.t('navigation.settings'), admin_settings_path

  add_breadcrumb I18n.t('definitions.index.title'), admin_definitions_path
end
```

Place a call to the render_breadcrumbs helper at the top of the view or where you want it to render:

```erb
<%= render_breadcrumbs %>
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
