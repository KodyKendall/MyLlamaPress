# https://dev.to/mjc/elegantly-integrate-mixpanel-with-your-rails-app-using-built-in-instrumentation-32mn
require 'mixpanel'

class ProcessActionInstrument
    def call(name, started, finished, unique_id, payload)
      return unless payload[:response]&.status.to_i.in? 200..399 # ignore redirects, bad requests, etc
      return if payload[:request].path.starts_with?('/rails') # ignore rails internal requests

      user = event_user(payload)
      name = event_name(payload)
      properties = event_properties(payload)
      return unless user

      Rails.logger.tagged 'ProcessActionInstrument' do |log|
        log.debug "event_name => #{name}"
        log.debug "event_properties => #{properties}"
        log.debug "event_user => #{user.inspect}"
      end

      ip = payload[:request].ip || user.current_sign_in_ip || user.last_sign_in_ip

      Mixpanel.track(user.public_id, name, properties, ip)

      return unless Mixpanel.people_set_recent?(user)

      Mixpanel.client.people.set(user.public_id, Mixpanel.expand_user_properties(user), ip, )
      user.update_column(:mixpanel_profile_last_set_at, Time.current)
    end

    private

    def event_name(payload)
      controller_name = payload[:controller][0..-11].underscore.gsub(%r(/), '_')
  
      case payload[:action]
      when 'index'
        "View #{controller_name.titleize}"
      else
        "#{payload[:action].titleize} #{controller_name.singularize.titleize}"
      end
    end

    def event_properties(payload)
        params = payload[:params]
        request = payload[:request]
        id = params[:id]

        {}.tap do |props|
            props["#{payload[:controller].demodulize[0..-11].singularize.titleize} ID"] = id if id
            

            params.keys.each do |key|
                props["#{key.titleize} ID"] = params[key] if key.ends_with? '_id'
            end

            props.update request.env[:mixpanel_extra_properties] if request.env.key? :mixpanel_extra_properties
        end
    end

    def event_user(payload)
        warden = payload[:request].env['warden']
    
        warden.user(:user) if warden.authenticated?(:user)
    end
end