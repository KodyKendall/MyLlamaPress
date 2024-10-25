require 'net/http'
require 'uri'
require 'json'
require 'base64'

class Wordpress
  def self.create_page!(wordpress_api_token, page)
    credentials = JSON.parse(wordpress_api_token)
    url = credentials['domain']
    username = credentials['username']
    auth_token = credentials['password']
    template_id = credentials['template_id']

    Rails.logger.info("Publishing for url: #{url} and username: #{username}")

    uri = URI.parse("#{url}/wp-json/wp/v2/pages")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Basic #{Base64.strict_encode64("#{username}:#{auth_token}")}"

    request.body = JSON.dump({
      "title" => page.slug,
      "content" => page.render_content,
      "template" => template_id,
      "status" => "publish"
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      raise "Failed to create WordPress page: #{response.code} #{response.message}"
    end
  end
end