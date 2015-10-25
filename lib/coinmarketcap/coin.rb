require 'faraday'
require 'json'

module Coinmarketcap
	class Coin
		attr_reader :markets, :position, :name, :symbol, :category, :marketcap, :price, :availablesupply,
								:availablesupplynumber, :volume24, :change1h, :change7h, :change7d, :timestamp
		def initialize(attributes)
			@markets = attributes["markets"]
			@position = attributes["position"]
			@name = attributes["name"]
			@symbol = attributes["symbol"]
			@category = attributes["category"]
			@marketcap = attributes["marketCap"]
			@price = attributes["price"]
			@availablesupply = attributes["availableSupply"]
			@availablesupplynumber = attributes["availableSupplyNumber"]
			@volume24 = attributes["volume24"]
			@change1h = attributes["change1h"]
			@change7h = attributes["change7h"]
			@change7d = attributes["change7d"]
			@timestamp = attributes["timestamp"]
		end

		# Coinmarketcap::Coin.find_by_symbol('VRC')
    def self.find_by_symbol(symbol)
      response = Faraday.get(BASE_URI + symbol + '.json')
      attributes = JSON.parse(response.body)
      new(attributes)
    end
	end
end