require 'mixpanel-ruby'

# https://dev.to/mjc/elegantly-integrate-mixpanel-with-your-rails-app-using-built-in-instrumentation-32mn
module Mixpanel
    def self.track(user, event_name, event_properties, ip)
        ip ||= user.current_sign_in_ip || user.last_sign_in_ip

        client.track(user, event_name, event_properties, ip)
    end

    def self.client
        @client ||= Mixpanel::Tracker.new(ENV['MIXPANEL_TOKEN'])
    end
end