# Patch::OrdersApi

All URIs are relative to *https://api.patch.io*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_order**](OrdersApi.md#cancel_order) | **PATCH** /v1/orders/{id}/cancel | Cancel an order |
| [**create_order**](OrdersApi.md#create_order) | **POST** /v1/orders | Creates an order |
| [**place_order**](OrdersApi.md#place_order) | **PATCH** /v1/orders/{id}/place | Place an order |
| [**retrieve_order**](OrdersApi.md#retrieve_order) | **GET** /v1/orders/{id} | Retrieves an order |
| [**retrieve_orders**](OrdersApi.md#retrieve_orders) | **GET** /v1/orders | Retrieves a list of orders |


## cancel_order

> <OrderResponse> cancel_order(id)

Cancel an order

Cancelling an order removes the associated offset allocation from an order. You will not be charged for cancelled orders. Only orders in the `draft` or `placed` state can be cancelled. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::OrdersApi.new
id = 'id_example' # String | 

begin
  # Cancel an order
  result = api_instance.cancel_order(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->cancel_order: #{e}"
end
```

#### Using the cancel_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderResponse>, Integer, Hash)> cancel_order_with_http_info(id)

```ruby
begin
  # Cancel an order
  data, status_code, headers = api_instance.cancel_order_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderResponse>
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->cancel_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_order

> <OrderResponse> create_order(create_order_request)

Creates an order

Creates an order in the `placed` state. To create a `draft` order, create an estimate first. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::OrdersApi.new
create_order_request = Patch::CreateOrderRequest.new # CreateOrderRequest | 

begin
  # Creates an order
  result = api_instance.create_order(create_order_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->create_order: #{e}"
end
```

#### Using the create_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderResponse>, Integer, Hash)> create_order_with_http_info(create_order_request)

```ruby
begin
  # Creates an order
  data, status_code, headers = api_instance.create_order_with_http_info(create_order_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderResponse>
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->create_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_order_request** | [**CreateOrderRequest**](CreateOrderRequest.md) |  |  |

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## place_order

> <OrderResponse> place_order(id)

Place an order

Placing an order confirms an order's allocation of offsets. Only orders that are in the `draft` state can be placed 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::OrdersApi.new
id = 'id_example' # String | 

begin
  # Place an order
  result = api_instance.place_order(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->place_order: #{e}"
end
```

#### Using the place_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderResponse>, Integer, Hash)> place_order_with_http_info(id)

```ruby
begin
  # Place an order
  data, status_code, headers = api_instance.place_order_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderResponse>
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->place_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_order

> <OrderResponse> retrieve_order(id)

Retrieves an order

Retrieves a given order and its allocation offsets or negative emissions. You can only retrieve orders associated with the organization you are querying for. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::OrdersApi.new
id = 'id_example' # String | 

begin
  # Retrieves an order
  result = api_instance.retrieve_order(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->retrieve_order: #{e}"
end
```

#### Using the retrieve_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderResponse>, Integer, Hash)> retrieve_order_with_http_info(id)

```ruby
begin
  # Retrieves an order
  data, status_code, headers = api_instance.retrieve_order_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderResponse>
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->retrieve_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_orders

> <OrderListResponse> retrieve_orders(opts)

Retrieves a list of orders

Retrieves a list of orders and its allocation offsets or negative emissions. You can only retrieve orders associated with the organization you are querying for. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::OrdersApi.new
opts = {
  page: 56, # Integer | 
  metadata: 'metadata_example', # String | 
  metadata_example1: 'metadata_example1_example', # String | 
  metadata_example2: 'metadata_example2_example' # String | 
}

begin
  # Retrieves a list of orders
  result = api_instance.retrieve_orders(opts)
  p result
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->retrieve_orders: #{e}"
end
```

#### Using the retrieve_orders_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderListResponse>, Integer, Hash)> retrieve_orders_with_http_info(opts)

```ruby
begin
  # Retrieves a list of orders
  data, status_code, headers = api_instance.retrieve_orders_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderListResponse>
rescue Patch::ApiError => e
  puts "Error when calling OrdersApi->retrieve_orders_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **Integer** |  | [optional] |
| **metadata** | **String** |  | [optional] |
| **metadata_example1** | **String** |  | [optional] |
| **metadata_example2** | **String** |  | [optional] |

### Return type

[**OrderListResponse**](OrderListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

