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

    def self.expand_user_properties(user)
        { '$email' => user.email,
        '$last_seen' => user.current_sign_in_at,
        '$created' => user.created_at,
        'sign_in_count' => user.sign_in_count }
    end

    def self.people_set_recent?(user)
        user.mixpanel_profile_last_set_at.nil? ||
        user.mixpanel_profile_last_set_at < 3.days.ago
    end
end