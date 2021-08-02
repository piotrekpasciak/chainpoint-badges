module Chainpoint
  class Error < StandardError; end

  class UnprocessableEntity < StandardError; end

  class HandleErrorsMiddleware < Faraday::Response::Middleware
    def on_complete(env)
      case env[:status]
      when 400..422
        raise Chainpoint::UnprocessableEntity, env.body['message']
      when 500...600
        raise Chainpoint::Error, env.body
      end
    end
  end

  class ApiClient
    def call
      Faraday.new(http_client_options) do |connection|
        connection.request :url_encoded
        connection.use Chainpoint::HandleErrorsMiddleware
        connection.response :json, content_type: /\bjson$/
        connection.adapter  Faraday.default_adapter
      end
    end

    private

    def http_client_options
      {
        url:     Rails.application.credentials.chainpoint[:api_url],
        headers: {
          'Accept'       => 'application/json',
          'Content-Type' => 'application/json'
        }
      }
    end
  end
end
