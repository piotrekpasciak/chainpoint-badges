module Chainpoint
  class CreateHashService < ::BaseService
    LOGGER_URL = 'log/chainpoint_api.log'.freeze

    def initialize(hash:, api_client: Chainpoint::ApiClient.new)
      @hash       = hash
      @api_client = api_client.call
    end

    def call
      response = create_hash_request

      success(response.body)
    rescue Chainpoint::UnprocessableEntity, Faraday::Error => e
      chainpoint_logger.error(e.message)

      failure(e.message)
    end

    private

    attr_reader :hash, :api_client

    def create_hash_request
      api_client.post(
        '/hashes', {
          hashes: [
            hash
          ]
        }.to_json
      )
    end

    def chainpoint_logger
      Logger.new(LOGGER_URL)
    end
  end
end
