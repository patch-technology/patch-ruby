# Patch::EstimatesApi

All URIs are relative to *https://api.patch.io*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_bitcoin_estimate**](EstimatesApi.md#create_bitcoin_estimate) | **POST** /v1/estimates/crypto/btc | Create a bitcoin estimate given a timestamp and transaction value |
| [**create_ethereum_estimate**](EstimatesApi.md#create_ethereum_estimate) | **POST** /v1/estimates/crypto/eth | Create an ethereum estimate given a timestamp and gas used |
| [**create_flight_estimate**](EstimatesApi.md#create_flight_estimate) | **POST** /v1/estimates/flight | Create a flight estimate given the distance traveled in meters |
| [**create_mass_estimate**](EstimatesApi.md#create_mass_estimate) | **POST** /v1/estimates/mass | Create an estimate based on mass of CO2 |
| [**create_shipping_estimate**](EstimatesApi.md#create_shipping_estimate) | **POST** /v1/estimates/shipping | Create a shipping estimate given the distance traveled in meters, package weight, and transportation method. |
| [**create_vehicle_estimate**](EstimatesApi.md#create_vehicle_estimate) | **POST** /v1/estimates/vehicle | Create a vehicle estimate given the distance traveled in meters and the type of vehicle |
| [**retrieve_estimate**](EstimatesApi.md#retrieve_estimate) | **GET** /v1/estimates/{id} | Retrieves an estimate |
| [**retrieve_estimates**](EstimatesApi.md#retrieve_estimates) | **GET** /v1/estimates | Retrieves a list of estimates |


## create_bitcoin_estimate

> <EstimateResponse> create_bitcoin_estimate(create_bitcoin_estimate_request)

Create a bitcoin estimate given a timestamp and transaction value

Creates a bitcoin estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters, linked to the estimate. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
create_bitcoin_estimate_request = Patch::CreateBitcoinEstimateRequest.new # CreateBitcoinEstimateRequest | 

begin
  # Create a bitcoin estimate given a timestamp and transaction value
  result = api_instance.create_bitcoin_estimate(create_bitcoin_estimate_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_bitcoin_estimate: #{e}"
end
```

#### Using the create_bitcoin_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> create_bitcoin_estimate_with_http_info(create_bitcoin_estimate_request)

```ruby
begin
  # Create a bitcoin estimate given a timestamp and transaction value
  data, status_code, headers = api_instance.create_bitcoin_estimate_with_http_info(create_bitcoin_estimate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_bitcoin_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_bitcoin_estimate_request** | [**CreateBitcoinEstimateRequest**](CreateBitcoinEstimateRequest.md) |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_ethereum_estimate

> <EstimateResponse> create_ethereum_estimate(create_ethereum_estimate_request)

Create an ethereum estimate given a timestamp and gas used

Creates an ethereum estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters, linked to the estimate. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
create_ethereum_estimate_request = Patch::CreateEthereumEstimateRequest.new # CreateEthereumEstimateRequest | 

begin
  # Create an ethereum estimate given a timestamp and gas used
  result = api_instance.create_ethereum_estimate(create_ethereum_estimate_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_ethereum_estimate: #{e}"
end
```

#### Using the create_ethereum_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> create_ethereum_estimate_with_http_info(create_ethereum_estimate_request)

```ruby
begin
  # Create an ethereum estimate given a timestamp and gas used
  data, status_code, headers = api_instance.create_ethereum_estimate_with_http_info(create_ethereum_estimate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_ethereum_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_ethereum_estimate_request** | [**CreateEthereumEstimateRequest**](CreateEthereumEstimateRequest.md) |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_flight_estimate

> <EstimateResponse> create_flight_estimate(create_flight_estimate_request)

Create a flight estimate given the distance traveled in meters

Creates a flight estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters, linked to the estimate. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
create_flight_estimate_request = Patch::CreateFlightEstimateRequest.new({distance_m: 37}) # CreateFlightEstimateRequest | 

begin
  # Create a flight estimate given the distance traveled in meters
  result = api_instance.create_flight_estimate(create_flight_estimate_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_flight_estimate: #{e}"
end
```

#### Using the create_flight_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> create_flight_estimate_with_http_info(create_flight_estimate_request)

```ruby
begin
  # Create a flight estimate given the distance traveled in meters
  data, status_code, headers = api_instance.create_flight_estimate_with_http_info(create_flight_estimate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_flight_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_flight_estimate_request** | [**CreateFlightEstimateRequest**](CreateFlightEstimateRequest.md) |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_mass_estimate

> <EstimateResponse> create_mass_estimate(create_mass_estimate_request)

Create an estimate based on mass of CO2

Creates an estimate for the mass of CO2 to be compensated. An order in the `draft` state will also be created, linked to the estimate. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
create_mass_estimate_request = Patch::CreateMassEstimateRequest.new({mass_g: 37}) # CreateMassEstimateRequest | 

begin
  # Create an estimate based on mass of CO2
  result = api_instance.create_mass_estimate(create_mass_estimate_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_mass_estimate: #{e}"
end
```

#### Using the create_mass_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> create_mass_estimate_with_http_info(create_mass_estimate_request)

```ruby
begin
  # Create an estimate based on mass of CO2
  data, status_code, headers = api_instance.create_mass_estimate_with_http_info(create_mass_estimate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_mass_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_mass_estimate_request** | [**CreateMassEstimateRequest**](CreateMassEstimateRequest.md) |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_shipping_estimate

> <EstimateResponse> create_shipping_estimate(create_shipping_estimate_request)

Create a shipping estimate given the distance traveled in meters, package weight, and transportation method.

Creates a shipping estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
create_shipping_estimate_request = Patch::CreateShippingEstimateRequest.new({distance_m: 37, package_mass_g: 37, transportation_method: 'air'}) # CreateShippingEstimateRequest | 

begin
  # Create a shipping estimate given the distance traveled in meters, package weight, and transportation method.
  result = api_instance.create_shipping_estimate(create_shipping_estimate_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_shipping_estimate: #{e}"
end
```

#### Using the create_shipping_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> create_shipping_estimate_with_http_info(create_shipping_estimate_request)

```ruby
begin
  # Create a shipping estimate given the distance traveled in meters, package weight, and transportation method.
  data, status_code, headers = api_instance.create_shipping_estimate_with_http_info(create_shipping_estimate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_shipping_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_shipping_estimate_request** | [**CreateShippingEstimateRequest**](CreateShippingEstimateRequest.md) |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_vehicle_estimate

> <EstimateResponse> create_vehicle_estimate(create_vehicle_estimate_request)

Create a vehicle estimate given the distance traveled in meters and the type of vehicle

Creates an estimate and calculates the amount of CO2 to be compensated depending on the distance and the vehicle. An order in the `draft` state may be created based on the parameters, linked to the estimate. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
create_vehicle_estimate_request = Patch::CreateVehicleEstimateRequest.new({distance_m: 37}) # CreateVehicleEstimateRequest | 

begin
  # Create a vehicle estimate given the distance traveled in meters and the type of vehicle
  result = api_instance.create_vehicle_estimate(create_vehicle_estimate_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_vehicle_estimate: #{e}"
end
```

#### Using the create_vehicle_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> create_vehicle_estimate_with_http_info(create_vehicle_estimate_request)

```ruby
begin
  # Create a vehicle estimate given the distance traveled in meters and the type of vehicle
  data, status_code, headers = api_instance.create_vehicle_estimate_with_http_info(create_vehicle_estimate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->create_vehicle_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_vehicle_estimate_request** | [**CreateVehicleEstimateRequest**](CreateVehicleEstimateRequest.md) |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## retrieve_estimate

> <EstimateResponse> retrieve_estimate(id)

Retrieves an estimate

Retrieves a given estimate and its associated order. You can only retrieve estimates associated with the organization you are querying for. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
id = 'id_example' # String | 

begin
  # Retrieves an estimate
  result = api_instance.retrieve_estimate(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->retrieve_estimate: #{e}"
end
```

#### Using the retrieve_estimate_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateResponse>, Integer, Hash)> retrieve_estimate_with_http_info(id)

```ruby
begin
  # Retrieves an estimate
  data, status_code, headers = api_instance.retrieve_estimate_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->retrieve_estimate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**EstimateResponse**](EstimateResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_estimates

> <EstimateListResponse> retrieve_estimates(opts)

Retrieves a list of estimates

Retrieves a list of estimates and their associated orders. You can only retrieve estimates associated with the organization you are querying for. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::EstimatesApi.new
opts = {
  page: 56 # Integer | 
}

begin
  # Retrieves a list of estimates
  result = api_instance.retrieve_estimates(opts)
  p result
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->retrieve_estimates: #{e}"
end
```

#### Using the retrieve_estimates_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EstimateListResponse>, Integer, Hash)> retrieve_estimates_with_http_info(opts)

```ruby
begin
  # Retrieves a list of estimates
  data, status_code, headers = api_instance.retrieve_estimates_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EstimateListResponse>
rescue Patch::ApiError => e
  puts "Error when calling EstimatesApi->retrieve_estimates_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **Integer** |  | [optional] |

### Return type

[**EstimateListResponse**](EstimateListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

