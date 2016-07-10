require 'rails/generators'

module Bootswatch
  module Generators
    class LayoutGenerator < ::Rails::Generators::NamedBase
      argument :name, type: :string, default: "application",
               desc: 'The theme name for this bootswatch view layout'

      # needed for thor templates
      source_root File.expand_path("../templates", __FILE__)

      def theme_name
        file_name
      end

      def generate_layout
        app = ::Rails.application
        ext = app.config.generators.options[:rails][:template_engine] || :erb
        template "layout.html.#{ext}", "app/views/layouts/#{theme_name}.html.#{ext}", {theme_name: theme_name, app_name: application_name}
      end
    end
  end
end
