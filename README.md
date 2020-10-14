# Patch Ruby SDK
![Test](https://github.com/patch-technology/patch-ruby/workflows/Test/badge.svg)
[![Gem Version](https://badge.fury.io/rb/patch_ruby.svg)](https://badge.fury.io/rb/patch_ruby)
[![Discord](https://img.shields.io/discord/733029448558837792)](https://discord.gg/AU8543D)

The official Ruby gem for the [Patch API](https://www.usepatch.com)

## Documentation
For a complete API reference, check out [Patch's API Reference.](https://docs.usepatch.com/)

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

### Configuration

After installing the gem, you'll have to configure it with your API key which is available from the API key page in the Patch dashboard:
```ruby
require 'patch_ruby'

Patch.configure do |config|
  # Configure the Patch gem with your API key here
  config.access_token = ENV['SANDBOX_API_KEY']
end
```

### Orders
In Patch, orders represent a purchase of carbon offsets or negative emissions by mass. Place orders directly if you know the amount of carbon dioxide you would like to sequester. If you do not know how much to purchase, use an estimate.

In Patch, orders represent a purchase of carbon offsets or negative emissions by mass.
Place orders directly if you know the amount of carbon dioxide you would like to sequester.
If you do not know how much to purchase, use an estimate.
You can also create an order with a maximum desired price, and we'll allocate enough mass to
fulfill the order for you.

[API Reference](https://docs.usepatch.com/#/?id=orders)

#### Examples
```ruby
# Create an order - you can create an order
# providing either mass_g or total_price_cents_usd, but not both

# Create order with mass
mass = 1_000_000 # Pass in the mass in grams (i.e. 1 metric tonne)
Patch::Order.create_order(mass_g: mass)

# Create an order with maximum total price
total_price_cents_usd = 5_00 # Pass in the total price in cents (i.e. 5 dollars)
Patch::Order.create_order(total_price_cents_usd: total_price_cents_usd)

## You can also specify a project-id field (optional) to be used instead of the preferred one
project_id = 'pro_test_1234' # Pass in the project's ID
Patch::Order.create_order(mass_g: mass, project_id: project_id)

## Orders also accept a metadata field (optional)
metadata = {user: "john doe"}
Patch::Order.create_order(mass_g: mass, metadata: metadata)

# Retrieve an order
order_id = 'ord_test_1234' # Pass in the order's id
Patch::Order.retrieve_order(order_id)

# Place an order
order_id = 'ord_test_1234' # Pass in the order's id
Patch::Order.place_order(order_id)

# Cancel an order
order_id = 'ord_test_1234' # Pass in the order's id
Patch::Order.cancel_order(order_id)

# Retrieve a list of orders
page = 1 # Pass in which page of orders you'd like
Patch::Order.retrieve_orders(page: page)
```

### Estimates
Estimates allow API users to get a quote for the cost of compensating a certain amount of CO2. When creating an estimate, an order in the `draft` state will also be created, reserving the allocation of a project for 5 minutes. If you don't place your draft order within those 5 minutes, the order will automatically be cancelled.

[API Reference](https://docs.usepatch.com/#/?id=estimates)

#### Examples
```ruby
# Create an estimate
mass = 1_000_000 # Pass in the mass in grams (i.e. 1 metric tonne)
Patch::Estimate.create_mass_estimate(mass_g: mass)

## You can also specify a project-id field (optional) to be used instead of the preferred one
project_id = 'pro_test_1234' # Pass in the project's ID
Patch::Estimate.create_mass_estimate(mass_g: mass, project_id: project_id)

# Retrieve an estimate
estimate_id = 'est_test_1234'
Patch::Estimate.retrieve_estimate(estimate_id)

# Retrieve a list of estimates
page = 1 # Pass in which page of estimates you'd like
Patch::Estimate.retrieve_estimates(page: page)
```

### Projects
Projects are the ways Patch takes CO2 out of the air. They can represent reforestation, enhanced weathering, direct air carbon capture, etc. When you place an order via Patch, it is allocated to a project.

[API Reference](https://docs.usepatch.com/#/?id=projects)

#### Examples
```ruby
# Retrieve a project
project_id = 'pro_test_1234' # Pass in the project's ID
Patch::Project.retrieve_project(project_id)

# Retrieve a list of projects
page = 1 # Pass in which page of projects you'd like
Patch::Project.retrieve_projects(page: page)
```

### Preferences
Preferences are how you route your orders in Patch. If you don't have a preference, Patch will allocate your order to the least expensive option. If you do have a preference, all of your orders will be sent to that project. You can set your preferences via API, or through the [Patch Dashboard](https://dashboard.usepatch.com/projects).

[API Reference](https://docs.usepatch.com/#/?id=preferences)

#### Examples
```ruby
# Create a preference
project_id = 'pro_test_1234' # Pass in the project_id for your preference
Patch::Preference.create_preference(project_id: project_id)

# Retrieve a preference
preference_id = 'pre_test_1234' # Pass in the preferences's id
Patch::Preference.retrieve_preference(preference_id)

# Delete a preference
preference_id = 'pre_test_1234' # Pass in the preferences's id
Patch::Preference.delete_preference(preference_id)

# Retrieve a list of preferences
page = 1 # Pass in which page of preferences you'd like
Patch::Preference.retrieve_preferences(page: page)
```

## Development

To build the gem locally, run:
```
$ gem build patch_ruby.gemspec
```

This will create a .gem file. To install the local gem:
```
$ gem install patch_ruby-1.x.x.gem
```

Install dependencies:
```
$ bundle install
```

Set up required environment variables:
```
$ export SANDBOX_API_KEY=<SANDBOX API KEY>
```

Run tests:
```
$ bundle exec rspec
```
