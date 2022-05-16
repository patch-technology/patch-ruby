# Patch Ruby SDK

![Test](https://github.com/patch-technology/patch-ruby/workflows/Test/badge.svg)
[![Gem Version](https://badge.fury.io/rb/patch_ruby.svg)](https://badge.fury.io/rb/patch_ruby)
[![Discord](https://img.shields.io/discord/733029448558837792)](https://discord.gg/AU8543D)

The official Ruby gem for the [Patch API](https://www.patch.io)

## Documentation

For a complete API reference, check out [Patch's API Reference.](https://docs.patch.io/)

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

In Patch, orders represent a purchase of carbon offsets or negative emissions by amount. Place orders directly if you know the amount of carbon dioxide you would like to sequester. If you do not know how much to purchase, use an estimate.

You can also create an order with a maximum desired price, and we'll allocate enough to
fulfill the order for you.

[API Reference](https://docs.patch.io/#/?id=orders)

#### Examples

```ruby
# Create an order - you can create an order
# providing either amount (and unit) or total_price (and currency), but not both

# Create order with amount
amount = 1_000_000 # Pass in the amount in unit specified
unit = "g"
Patch::Order.create_order(amount: amount, unit: unit)

# Create an order with total price
total_price = 5_00 # Pass in the total price in smallest currency unit (ie cents for USD).
currency = "USD"
Patch::Order.create_order(total_price: total_price, currency: currency)

## You can also specify a project-id field (optional) to be used instead of the preferred one
project_id = 'pro_test_1234' # Pass in the project's ID
Patch::Order.create_order(amount: amount, unit: unit, project_id: project_id)

## Orders also accept a metadata field (optional)
metadata = {user: "john doe"}
Patch::Order.create_order(amount: amount, unit: unit, metadata: metadata)

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

[API Reference](https://docs.patch.io/#/?id=estimates)

#### Examples

```ruby
# Create a mass estimate
mass = 1_000_000 # Pass in the mass in grams (i.e. 1 metric tonne)
Patch::Estimate.create_mass_estimate(mass_g: mass)

# Create a flight estimate
distance_m = 1_000_000 # Pass in the distance traveled in meters
Patch::Estimate.create_flight_estimate(distance_m: distance_m)

# Create a shipping estimate
distance_m = 1_000_000 # Pass in the shipping distance in meters
package_mass_g = 10_000 # Pass in the weight of the package shipped in grams
transportation_method = "air" # Pass in the transportation method (air, rail, road, sea)
Patch::Estimate.create_shipping_estimate(
  distance_m: distance_m,
  package_mass_g: package_mass_g,
  transportation_method: transportation_method
)

# Create a vehicle estimate
distance_m = 1_000_000 # Pass in the shipping distance in meters
make = "Toyota" # Pass in the car make
model = "Corolla" # Pass in the car model
year = 2000 # Pass in the car year
Patch::Estimate.create_vehicle_estimate(
  distance_m: distance_m,
  make: make,
  model: model,
  year: year
)

# Create a flight estimate
transaction_value_btc_sats = 1000; # [Optional] Pass in the transaction value in satoshis
Patch::Estimate.create_bitcoin_estimate(transaction_value_btc_sats: transaction_value_btc_sats)

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

When fetching Projects, you can add filters to the query to narrow the result. Currently supported filters are:

- `country`
- `type`
- `minimum_available_mass`

[API Reference](https://docs.patch.io/#/?id=projects)

#### Examples

```ruby
# Retrieve a project
project_id = 'pro_test_1234' # Pass in the project's ID
Patch::Project.retrieve_project(project_id)

# Retrieve a list of projects
page = 1 # Pass in which page of projects you'd like
Patch::Project.retrieve_projects(page: page)

# Retrieve all projects from the United States
country = 'US'
Patch::Project.retrieve_projects(country: country)

# Retrieve all biomass projects
type = 'biomass'
Patch::Project.retrieve_projects(type: type)

# Retrieve a list of projects with at least 100 grams of available offsets
minimum_available_mass = 100
Patch::Project.retrieve_projects(minimum_available_mass: minimum_available_mass)

# Retrieve a project in a different language
# See http://docs.patch.test:3000/#/internationalization for more information and support 
project_id = 'pro_test_1234'
Patch::Project.retrieve_project(project_id, accept_language: 'fr')

# Retrieve a list of projects in a different language
# See http://docs.patch.test:3000/#/internationalization for more information and support 
Patch::Project.retrieve_projects(accept_language: 'fr')
```
## Contributing

While we value open-source contributions to this SDK, the core of this library is generated programmatically. Complex additions made directly to the library would have to be moved over to our generation code, otherwise they would be overwritten upon the next generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README, as well as new test cases are always very welcome!

### Testing locally

To build the gem locally, run:

```bash
gem build patch_ruby.gemspec
```

This will create a .gem file. To install the local gem:

```bash
gem install patch_ruby-1.x.x.gem
```

### Running tests

Set up the required environment variable.

```bash
export SANDBOX_API_KEY=<SANDBOX API KEY>
```

then run the tests:

```bash
make test
```
