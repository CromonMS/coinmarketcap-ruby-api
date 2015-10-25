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
		def self.list
			response = Faraday.get(BASE_URI + 'all.json')
			coins = JSON.parse(response.body)
			all_coin_list = coins["markets"]

			# This small bit of code, prints out all available pairs to terminal when run in IRB
			all_coin_list.map do |coin|
				puts "#{coin["name"]}, #{coin["symbol"]}"
			end
			new
		end	
	end
end