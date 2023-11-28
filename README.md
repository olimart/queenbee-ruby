# Queenbee

[![Tests](https://github.com/olimart/queenbee-ruby/actions/workflows/ci.yml/badge.svg)](https://github.com/olimart/queenbee-ruby/actions/workflows/ci.yml)

Simple gem for communicating with external API. Heavily inspired by stripe gem.

## Installation

Add this line to your application's Gemfile:

    gem 'queenbee'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install queenbee

## Usage

In your app

1. Set token

```ruby
Queenbee.token = ENV['QUEENBEE_TOKEN']
```

2. Send order/event

```ruby
Queenbee::Order.create(
  date: Time.now,
  currency: 'cad',
  client_email: 'client@email.com',
  amount: '15',
  total_price: '15',
  city: 'Nancy',
  country: 'France',
  shipping: 0,
  uid: SecureRandom.hex(4),
  source: 'Stripe payment form'
)
```

Optional attributes are available for subscription-type application such as:

```ruby
subscribed_at: '2015-05-05 20:13:45',
unsubscribed_at: '2016-05-05 20:13:45'
```

**For Sinatra app** you may need to add `require 'bundler/setup'`

3. Update order

```ruby
Queenbee::Order.save(
  uid: '111',
  unsubscribed_at: Time.zone.now
)
```

4. Delete order

```ruby
Queenbee::Order.delete('111')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To experiment with that code, run `bin/console` for an interactive prompt.

## Tests

```ruby
rake test
```

## Complete list of parameters

### Order

- uid (string, must be unique per application)
- date (datetime. default to record creation timestamp. Should be used to send historic data)
- currency (string. i.e. 'CAD')
- amount (decimal)
- tax (decimal)
- shipping (decimal)
- total_price (decimal)
- gift (boolean, default false)
- coupon (boolean, default false)
- coupon_code (string)
- country (string. i.e. 'Canada')
- city (string)
- url (string)
- client_email (string)
- products_count (integer, default 1)
- subscribed_at (datetime. For recurring order)
- unsubscribed_at (datetime. For recurring order)
- fees (decimal)

### Event

- date (datetime. required. i.e. 2014-07-01 14:50:28)
- status: (string. required)
- message: (text. required)
- metadata: (hash. optional)
