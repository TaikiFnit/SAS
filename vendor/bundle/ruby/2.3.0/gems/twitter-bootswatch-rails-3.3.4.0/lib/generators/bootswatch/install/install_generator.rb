require 'rails/generators'
require 'less-rails'

module Bootswatch
  module Generators
    class InstallGenerator < ::Rails::Generators::NamedBase

      DEFAULT_RAILS_APP_JS_FILE='app/assets/javascripts/application.js'
      DEFAULT_RAILS_APP_CSS_FILE='app/assets/stylesheets/application.css'
      DEFAULT_THEME_NAME='bootswatch'

      argument :name, type: :string, default: DEFAULT_THEME_NAME,
               desc: 'The theme name for this bootswatch'

      # needed for thor templates
      source_root File.expand_path("../templates", __FILE__)

      def theme_name
        file_name
      end

      def use_default_theme_name?
        theme_name === DEFAULT_THEME_NAME
      end

      def theme_info
        "#{use_default_theme_name? ? 'bootstrap'.capitalize : theme_name.capitalize}"
      end

      def remove_require_tree_directives
        if File.exist?(DEFAULT_RAILS_APP_JS_FILE)
          gsub_file DEFAULT_RAILS_APP_JS_FILE, /\/\/=\s*require_tree\s*\./, ''
        end

        if File.exist?(DEFAULT_RAILS_APP_CSS_FILE)
          gsub_file DEFAULT_RAILS_APP_CSS_FILE, /=\s*require_tree\s*\./, ''
        end
      end

      def add_assets

        if use_default_theme_name?
          if File.exist?(DEFAULT_RAILS_APP_JS_FILE)
            unless File.read(DEFAULT_RAILS_APP_JS_FILE).include?(theme_name)
              insert_into_file DEFAULT_RAILS_APP_JS_FILE,
                             "//= require #{theme_name}/loader\n//= require #{theme_name}/bootswatch\n",
                             :after => "jquery_ujs\n"
            end
          else
            template 'application.js.tt', DEFAULT_RAILS_APP_JS_FILE, {theme_name: theme_name, theme_info: theme_info}
          end

          if File.exist?(DEFAULT_RAILS_APP_CSS_FILE)
            unless File.read(DEFAULT_RAILS_APP_CSS_FILE).include?(theme_name)
              insert_into_file DEFAULT_RAILS_APP_CSS_FILE,
                             " *= require #{theme_name}/loader\n *= require #{theme_name}/bootswatch\n",
                             :after => "require_self\n"
            end

          else
            template 'application.css.tt', DEFAULT_RAILS_APP_CSS_FILE, {theme_name: theme_name, theme_info: theme_info}
          end
        else
          template 'application.js.tt', "app/assets/javascripts/#{theme_name}.js", {theme_name: theme_name, theme_info: theme_info}
          template 'application.css.tt', "app/assets/stylesheets/#{theme_name}.css", {theme_name: theme_name, theme_info: theme_info}
        end

      end

      def add_javascripts

        javascripts_dest_path = "app/assets/javascripts/#{theme_name}"
        empty_directory javascripts_dest_path

        template 'loader.js.tt', File.join(javascripts_dest_path,'loader.js'), {theme_name: theme_name, theme_info: theme_info}

        # upgrade to new extension to trigger recompile
        if File.exist?(File.join(javascripts_dest_path,'bootswatch.js'))
          File.rename(File.join(javascripts_dest_path,'bootswatch.js'), File.join(javascripts_dest_path,'bootswatch.js'))
        end

        template 'bootswatch.js.tt', File.join(javascripts_dest_path,'bootswatch.js'), {theme_name: theme_name, theme_info: theme_info}

      end

      def add_stylesheets

        stylesheets_dest_path = "app/assets/stylesheets/#{theme_name}"
        empty_directory stylesheets_dest_path

        bootstrap_less_imports = File.read(find_in_source_paths('bootstrap.less')).scan(Less::Rails::ImportProcessor::IMPORT_SCANNER).flatten.compact.uniq

        template 'loader.css.less.tt', File.join(stylesheets_dest_path,'loader.css.less'), {
            less_imports: bootstrap_less_imports,
            theme_name: theme_name,
            theme_info: theme_info}

        # now variables and mixins

        template 'variables.less.tt', File.join(stylesheets_dest_path,'variables.less'), {
            theme_name: theme_name,
            theme_info: theme_info}

        template 'mixins.less.tt', File.join(stylesheets_dest_path,'mixins.less'), {
            theme_name: theme_name,
            theme_info: theme_info}

        # upgrade to new extension to trigger recompile
        if File.exist?(File.join(stylesheets_dest_path,'bootswatch.less'))
          File.rename(File.join(stylesheets_dest_path,'bootswatch.less'), File.join(stylesheets_dest_path,'bootswatch.css.less'))
        end

        template 'bootswatch.css.less.tt', File.join(stylesheets_dest_path,'bootswatch.css.less'), {
            theme_name: theme_name,
            theme_info: theme_info}

        template 'base.less.tt', File.join(stylesheets_dest_path,'base.less'), {
            theme_name: theme_name,
            theme_info: theme_info}

      end

    end
  end
end
