require './test/test_helper'

class CoinmarketcapCoinTest < Minitest::Test
  def test_exists
    assert Coinmarketcap::Coin
  end

  def test_it_returns_a_coin_by_symbol
  	VCR.use_cassette('response') do
  		response = Coinmarketcap::Coin.find_by_symbol('BTC')
  		assert_equal Coinmarketcap::Coin, response.class

  		# Check fields are accessible by our model
  		assert_equal "BTC", response.symbol
  		assert_equal "Bitcoin", response.name
  	end
	end
end