require 'faraday'
require 'json'

module Coinmarketcap
	class Coins

		# Coinmarketcap::Coins.market_count
		def self.market_count
			response = Faraday.get(BASE_URI + 'all.json')
			coins = JSON.parse(response.body)			
			coins["markets"].count
		end

		# Coinmarketcap::Coins.list
		# accepts an integer in case you don't want all records
		def self.list(count = self.market_count - 0)
			response = Faraday.get(BASE_URI + 'all.json')
			coins = JSON.parse(response.body)
			all_coin_list = coins["markets"].first(count)
		end	
	end
end