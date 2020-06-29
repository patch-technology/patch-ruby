# PatchRuby::OrdersApi

All URIs are relative to *https://api.usepatch.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancel_order**](OrdersApi.md#cancel_order) | **PATCH** /v1/orders/{id}/cancel | Cancel an order
[**create_order**](OrdersApi.md#create_order) | **POST** /v1/orders | Creates an order
[**place_order**](OrdersApi.md#place_order) | **PATCH** /v1/orders/{id}/place | Place an order
[**retrieve_order**](OrdersApi.md#retrieve_order) | **GET** /v1/orders/{id} | Retrieves an order
[**retrieve_orders**](OrdersApi.md#retrieve_orders) | **GET** /v1/orders | Retrieves a list of orders



## cancel_order

> OrderResponse cancel_order(id)

Cancel an order

Cancelling an order removes the associated offset allocation from an order. You will not be charged for cancelled orders. Only orders in the `draft` state can be cancelled. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::OrdersApi.new
id = 'id_example' # String | 

begin
  #Cancel an order
  result = api_instance.cancel_order(id)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling OrdersApi->cancel_order: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_order

> OrderResponse create_order(opts)

Creates an order

Creates an order in the `placed` state. To create a `draft` order, create an estimate first. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::OrdersApi.new
opts = {
  unknown_base_type: PatchRuby::UNKNOWN_BASE_TYPE.new # UNKNOWN_BASE_TYPE | 
}

begin
  #Creates an order
  result = api_instance.create_order(opts)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling OrdersApi->create_order: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unknown_base_type** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md)|  | [optional] 

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## place_order

> place_order(id)

Place an order

Placing an order confirms an order's allocation of offsets. Only orders that are in the `draft` state can be placed 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::OrdersApi.new
id = 'id_example' # String | 

begin
  #Place an order
  api_instance.place_order(id)
rescue PatchRuby::ApiError => e
  puts "Exception when calling OrdersApi->place_order: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_order

> OrderResponse retrieve_order(id)

Retrieves an order

Retrieves a given order and its allocation offsets or negative emissions. You can only retrieve orders associated with the organization you are querying for. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::OrdersApi.new
id = 'id_example' # String | 

begin
  #Retrieves an order
  result = api_instance.retrieve_order(id)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling OrdersApi->retrieve_order: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_orders

> OrderListResponse retrieve_orders(opts)

Retrieves a list of orders

Retrieves a list of orders and its allocation offsets or negative emissions. You can only retrieve orders associated with the organization you are querying for. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::OrdersApi.new
opts = {
  page: 56 # Integer | 
}

begin
  #Retrieves a list of orders
  result = api_instance.retrieve_orders(opts)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling OrdersApi->retrieve_orders: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Integer**|  | [optional] 

### Return type

[**OrderListResponse**](OrderListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

