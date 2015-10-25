require 'test_helper'

class CoinmarketcapTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Coinmarketcap::VERSION
  end

end
