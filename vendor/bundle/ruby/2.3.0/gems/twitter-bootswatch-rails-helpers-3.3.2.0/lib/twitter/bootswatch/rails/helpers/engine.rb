require 'rails'

require File.dirname(__FILE__) + '/breadcrumbs.rb'

module Twitter
  module Bootswatch
    module Rails
      module Helpers
        class Engine < ::Rails::Engine

          initializer 'twitter-bootswatch-rails-helpers.setup_helpers' do |app|
            app.config.to_prepare do
              ActionController::Base.send :include, BreadCrumbs
              ActionController::Base.send :helper, FlashHelper
            end
          end
        end
      end
    end
  end
end
