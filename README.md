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

PatchRuby.configure do |config|
  # Configure the Patch gem with your API key here
  config.access_token = 'key_test_1234'
end
```

Once configured, you can test it out:
```ruby
# Retrieve and print all your orders
orders_api = PatchRuby::OrdersApi.new

begin
  orders_response = orders_api.retrieve_orders

  orders_response.data.each do |order|
    puts "Order ID: #{order.id}, Order State: #{order.state}"
  end
# Rescue from any Patch API errors
rescue PatchRuby::ApiError => e
  puts "Failed to retrieve Orders with status code #{e.code}: #{e.message}"
end
```

## Development

Install dependencies:
```shell
bundle install --path vendor/bundle
```

Run tests:
```shell
bundle exec rspec
```

Building and installing the gem locally:
```shell
gem build patch_ruby.gemspec
gem install patch_ruby-<version>.gem
```

## Documentation for API Endpoints

All URIs are relative to *https://api.usepatch.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*PatchRuby::OrdersApi* | [**cancel_order**](docs/OrdersApi.md#cancel_order) | **PATCH** /v1/orders/{id}/cancel | Cancel an order
*PatchRuby::OrdersApi* | [**create_order**](docs/OrdersApi.md#create_order) | **POST** /v1/orders | Creates an order
*PatchRuby::OrdersApi* | [**place_order**](docs/OrdersApi.md#place_order) | **PATCH** /v1/orders/{id}/place | Place an order
*PatchRuby::OrdersApi* | [**retrieve_order**](docs/OrdersApi.md#retrieve_order) | **GET** /v1/orders/{id} | Retrieves an order
*PatchRuby::OrdersApi* | [**retrieve_orders**](docs/OrdersApi.md#retrieve_orders) | **GET** /v1/orders | Retrieves a list of orders
*PatchRuby::PreferencesApi* | [**create_preference**](docs/PreferencesApi.md#create_preference) | **POST** /v1/preferences | creates a project preference
*PatchRuby::PreferencesApi* | [**delete_preference**](docs/PreferencesApi.md#delete_preference) | **DELETE** /v1/preferences/{id} | Deletes an organization's preference for a project
*PatchRuby::PreferencesApi* | [**retrieve_preference**](docs/PreferencesApi.md#retrieve_preference) | **GET** /v1/preferences/{id} | Retrieve the preference
*PatchRuby::PreferencesApi* | [**retrieve_preferences**](docs/PreferencesApi.md#retrieve_preferences) | **GET** /v1/preferences | Retrieves a list of preferences
*PatchRuby::ProjectsApi* | [**retrieve_project**](docs/ProjectsApi.md#retrieve_project) | **GET** /v1/projects/{id} | Retrieves a project
*PatchRuby::ProjectsApi* | [**retrieve_projects**](docs/ProjectsApi.md#retrieve_projects) | **GET** /v1/projects | Retrieves a list of projects


## Documentation for Models

 - [PatchRuby::Allocation](docs/Allocation.md)
 - [PatchRuby::ErrorResponse](docs/ErrorResponse.md)
 - [PatchRuby::Order](docs/Order.md)
 - [PatchRuby::OrderListResponse](docs/OrderListResponse.md)
 - [PatchRuby::OrderResponse](docs/OrderResponse.md)
 - [PatchRuby::Preference](docs/Preference.md)
 - [PatchRuby::PreferenceListResponse](docs/PreferenceListResponse.md)
 - [PatchRuby::PreferenceResponse](docs/PreferenceResponse.md)
 - [PatchRuby::Project](docs/Project.md)
 - [PatchRuby::ProjectListResponse](docs/ProjectListResponse.md)
 - [PatchRuby::ProjectResponse](docs/ProjectResponse.md)

