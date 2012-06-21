module ActionController
  module ForceSSL
    module ClassMethods
      def force_ssl(options = {})
        host = options.delete(:host)
        before_filter(options) do
          if !request.ssl? && !Rails.env.development? && !Rails.env.test?
            redirect_options = {:protocol => 'https://', :status => :moved_permanently}
            redirect_options.merge!(:host => host) if host
            redirect_to redirect_options
          end
        end
      end
    end
  end
end
