require 'faraday'
require 'json'

module Coinmarketcap
	class Coins

		attr_reader :count, :markets, :timestamp, :currency_exchange_rates

		def initialize(attributes)
			@count = attributes["markets"].count # @coins = Coinmarketcap::Coins.list(10) | @coins.count
			@markets = attributes["markets"]
			@timestamp = attributes["timestamp"]
			@currency_exchange_rates = attributes["currencyExchangeRates"]
		end

		# Coinmarketcap::Coins.all
		def self.all
			response = Faraday.get(BASE_URI + 'all.json')
			attributes = JSON.parse(response.body)
			new(attributes)
			# attributes["markets"]
		end

		# Coinmarketcap::Coins.market_count
		def self.market_count
			response = Faraday.get(BASE_URI + 'all.json')
			attributes = JSON.parse(response.body)			
			attributes["markets"].count
		end
	end
end