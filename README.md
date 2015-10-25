# Coinmarketcap

### Currently a WIP.

Simple API wrapper for Coinmarketcap using *http://coinmarketcap.northpole.ro/*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coinmarketcap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coinmarketcap

## Usage

TODO: Write usage instructions here

#### Example usage:

##### Coinmarketcap::Coin

```ruby
@coin = Coinmarketcap::Coin.find_by_symbol('VRC')
```
Will return a result based on an the API endpoint:

```url
http://coinmarketcap.northpole.ro/api/v5/VRC.json
```

You can then access available data for the coin.

```ruby
@coin.name
=> 'Vericoin'
@coin.availablesupply
=> '27311704'
```
Some of these endpoints return a Hash.
For instance @coin.price

```ruby
@coin.price
=> {"usd"=>"0.0219445", "btc"=>"7.64844e-05", "eur"=>"0.019917135423", "cny"=>"0.139330677735", "gbp"=>"0.014330285168000001"
, "cad"=>"0.028892567589999998", "rub"=>"1.365654732345", "hkd"=>"0.170069084998", "jpy"=>"2.6654535812999995", "aud"=>"0.030
3988161255"}

@coin.price['gbp']
=> "0.014330285168000001"
```

##### Coinmarketcap::Coins

Added a couple of methods that currently work in Terminal.

```ruby
@all_coins = Coinmarketcap::Coins.list
=> Returns a list of available currencies, currently ordered default, most recent coins first.

@market_count = Coinmarketcap::Coins.market_count
=> Returns number of available markets.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/coinmarketcap.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

