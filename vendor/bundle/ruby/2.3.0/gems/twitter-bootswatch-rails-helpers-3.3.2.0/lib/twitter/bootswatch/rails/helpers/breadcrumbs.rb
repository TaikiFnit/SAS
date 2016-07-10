module Twitter
  module Bootswatch
    module Rails
      module Helpers
        module BreadCrumbs
          def self.included(base)
            base.extend(ClassMethods)
          end

          module ClassMethods
            def add_breadcrumb(name, url, options={})
              before_filter options do |controller|
                controller.send :add_breadcrumb, name, url
              end
            end
          end

          protected

          def add_breadcrumb(name, url = '', options = {})
            @breadcrumbs ||= []
            url = eval(url.to_s) if url =~ /_path|_url|@/
            @breadcrumbs << {name: name, url: url, options: options}
          end

          def render_breadcrumbs
            s = render partial: 'twitter/bootswatch/breadcrumbs'
            s.first
          end
        end
      end
    end
  end
end
