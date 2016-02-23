# Queenbee

[![Build Status](https://semaphoreapp.com/api/v1/projects/7959e7f9-8fcb-4d10-85fe-79bc840b028c/262003/shields_badge.svg)](https://semaphoreapp.com/olimart/queenbee-ruby)

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

2. Send order

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

Optional attributes are avaiable for subscription-type such as:

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


## Tests

```ruby
rake test
```

## Complete list of parameters

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
