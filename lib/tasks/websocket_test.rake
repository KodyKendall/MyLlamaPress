# lib/tasks/websocket.rake
namespace :websocket do
    desc 'Start WebSocket client with Rails environment'
    task monitor: :environment do
        require 'async'
        require 'async/websocket/client'
        require 'json'
        require 'logger'
        require 'timeout'
        
        # Set up a logger to capture detailed output
        logger = Logger.new(STDOUT)
        logger.level = Logger::DEBUG
        
        Async do
          begin
            # Add connection timeout
            Timeout.timeout(120) do
                uri = URI(ENV['LLAMABOT_WEBSOCKET_URL'])
                uri.scheme = 'wss'
                endpoint = Async::HTTP::Endpoint.new(
                uri,
                ssl_context: OpenSSL::SSL::SSLContext.new.tap do |ctx|
                    ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER
                    
                    # Use system certificates from macOS
                    # ctx.ca_path = '/etc/ssl/certs'  # Try this first
                    # If the above doesn't work, try these alternatives:
                    # ctx.ca_file = '/usr/local/etc/openssl/cert.pem'  # Homebrew OpenSSL

                    # to test this command, run: rails websocket:monitor
                    DEVELOPMENT_ENVIRONMENT = true
                    
                    # Certificate and key setup
                      if DEVELOPMENT_ENVIRONMENT
                      #MacOS:
                        #ctx.ca_file = '/usr/local/etc/ca-certificates/cert.pem'

                        #Brian's Nightmare mode 
                        ctx.ca_file = '/etc//ssl/cert.pem'
                        #run rails with ssl mode: 
                        # rails s -b 'ssl://127.0.0.1:3000?key=config/local-certs/localhost-key.pem&cert=config/local-certs/localhost.pem'
                        # to generate these, run:  openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/CN=stagingbot.llamapress.ai"
                        ctx.cert = OpenSSL::X509::Certificate.new(File.read(File.expand_path('~/.ssl/llamapress/cert.pem')))
                        ctx.key = OpenSSL::PKey::RSA.new(File.read(File.expand_path('~/.ssl/llamapress/key.pem')))
                      else
                        #Ubuntu: 
                        ctx.ca_file = '/etc/ssl/certs/ca-certificates.crt'
                      end
                end
                )

              
              # Add connection options for debugging
              options = {
                headers: {
                  'User-Agent' => 'Ruby WebSocket Client/1.0'
                },
                timeout: 5  # Connection timeout in seconds
              }
              
              Async::WebSocket::Client.connect(endpoint) do |connection|
                logger.info "WebSocket connection opened"
                
                # Run continuous ping loop
                loop do
                  message = {
                    type: "ping",
                    id: Time.now.to_i
                  }
                  logger.info "Sending message: #{message}"
                  connection.write(message.to_json)
                  
                  # Read response with timeout
                  start_time = Time.now
                  timeout = 30  # seconds
                  
                  # Read messages with timeout
                  response_received = false
                  while Time.now - start_time < timeout && !response_received
                    message = connection.read
                    break unless message
                    
                    logger.info "Received message: #{message}"
                    parsed_message = JSON.parse(message) rescue nil
                    
                    if parsed_message && parsed_message['type'] == 'pong'
                      logger.info "Received valid pong response"
                      response_received = true
                    end
                  end
                  
                  if Time.now - start_time >= timeout
                    logger.error "Timeout waiting for response"
                  end

                  # Wait 10 seconds before sending next ping
                  sleep 10
                end

                logger.info "Connection closed normally"
              end
            end
          rescue Timeout::Error => e
            logger.error "Connection timeout: #{e.message}"
          rescue Async::WebSocket::ConnectionError => e
            logger.error "WebSocket connection error: #{e.message}"
          rescue => e
            logger.error "Unexpected error: #{e.message}"
            logger.error e.backtrace.join("\n")
          end
        end
    end
  
    desc 'Start WebSocket client in debug mode'
    task debug: :environment do
      Rails.logger.level = Logger::DEBUG
      Rake::Task['websocket:monitor'].invoke
    end
  end