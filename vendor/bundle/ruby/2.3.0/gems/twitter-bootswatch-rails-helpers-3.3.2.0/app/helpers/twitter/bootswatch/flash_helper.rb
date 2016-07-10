module Twitter
  module Bootswatch
    module FlashHelper

      def bootswatch_flash(alert_dismissable=true)
        alert_dismissable_class = alert_dismissable ? ' alert-dismissable' : ''
        flash_messages = ''
        flash.each do |type, message|
          alert_type_class = bootswatch_alert_types(type)
          if alert_dismissable
          alert_div = content_tag(:div, raw('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>') + message, :class => "alert #{alert_type_class}#{alert_dismissable_class}")
          else
            alert_div = content_tag(:div, raw(message), :class => "alert #{alert_type_class}")
          end
          flash_messages << alert_div if message
        end
        raw(flash_messages)
      end

      def bootswatch_flash_block(alert_dismissable=true)
        output = ''
        flash.each do |type, message|
          output << bootswatch_flash_container(type, alert_dismissable) do
              message
          end
        end

        raw(output)
      end

      def bootswatch_flash_container(type, alert_dismissable=true, &message)
        alert_dismissable_class = alert_dismissable ? ' alert-dismissable' : ''
        alert_type_class = bootswatch_alert_types(type)
        message_html = capture(&message)
        if alert_dismissable
          output = content_tag(:div, :class => "alert #{alert_type_class}#{alert_dismissable_class}") do
            '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>'.html_safe.safe_concat(message_html)
          end
        else
          output = content_tag(:div, :class => "alert #{alert_type_class}") do
            message_html.html_safe
          end
        end

        raw(output)
      end

      def bootswatch_alert_types(alert_type)
        #Rails 4.1 started using Strings instead of Symbol.
        case alert_type
          when :info, 'info' then 'alert-info'
          when :notice, :success, 'notice', 'success' then 'alert-success'
          when :alert, :error, 'alert', 'error' then 'alert-danger'
          else 'alert-warning' # warning
        end
      end
    end

  end
end