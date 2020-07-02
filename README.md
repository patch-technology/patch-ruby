# Patch ruby
![Test](https://github.com/patch-technology/patch-ruby/workflows/Test/badge.svg)

The official Ruby gem for the [Patch API](https://www.usepatch.com)

## Documentation

For detailed documentation and examples, see the [Patch API docs](https://www.usepatch.com).

## Installation

Add the gem to your Gemfile:
```ruby
gem 'patch_ruby'
```

Then run:
```shell
bundle
```

Or install it directly with
```shell
gem install patch_ruby
```

### Requirements
- Ruby 1.9+

## Usage

After installing the gem, you'll have to configure it with your API key which is available from the API key page in the Patch dashboard:
```ruby
require 'patch_ruby'

Patch.configure do |config|
  # Configure the Patch gem with your API key here
  config.access_token = ENV['PATCH_RUBY_API_KEY']
end
```

Once configured, you can test it out:
```ruby
begin
  orders_response = Patch::Order.retrieve_orders

  orders_response.data.each do |order|
    puts "Order ID: #{order.id}, Order State: #{order.state}"
  end
# Rescue from any Patch API errors
rescue Patch::ApiError => e
  puts "Failed to retrieve Orders with status code #{e.code}: #{e.message}"
end
```
