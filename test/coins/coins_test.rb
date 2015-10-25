require './test/test_helper'

class CoinmarketcapCoinTest < Minitest::Test
  def test_exists
    assert Coinmarketcap::Coin
  end

	def test_it_returns_market_count
		VCR.use_cassette('all_coins') do
			all_coins = Coinmarketcap::Coin.market_count
			assert_equal Fixnum, all_coins.class
			assert_operator all_coins, :>, 1
		end
	end

	def test_it_returns_a_list_of_all_coins
		VCR.use_cassette('all_coins') do
			response = Coinmarketcap::Coin.list

			assert response.kind_of?(Array)
		end
	end	

end
