# Patch::PreferencesApi

All URIs are relative to *https://api.patch.io*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_preference**](PreferencesApi.md#create_preference) | **POST** /v1/preferences | creates a project preference |
| [**delete_preference**](PreferencesApi.md#delete_preference) | **DELETE** /v1/preferences/{id} | Deletes an organization&#39;s preference for a project |
| [**retrieve_preference**](PreferencesApi.md#retrieve_preference) | **GET** /v1/preferences/{id} | Retrieve the preference |
| [**retrieve_preferences**](PreferencesApi.md#retrieve_preferences) | **GET** /v1/preferences | Retrieves a list of preferences |


## create_preference

> <PreferenceResponse> create_preference(create_preference_request)

creates a project preference

Creates a project preference for the given organization. If you have a `preference` in place, all of your orders will be directed to the project the preference points to. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::PreferencesApi.new
create_preference_request = Patch::CreatePreferenceRequest.new({project_id: 'project_id_example'}) # CreatePreferenceRequest | 

begin
  # creates a project preference
  result = api_instance.create_preference(create_preference_request)
  p result
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->create_preference: #{e}"
end
```

#### Using the create_preference_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PreferenceResponse>, Integer, Hash)> create_preference_with_http_info(create_preference_request)

```ruby
begin
  # creates a project preference
  data, status_code, headers = api_instance.create_preference_with_http_info(create_preference_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PreferenceResponse>
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->create_preference_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_preference_request** | [**CreatePreferenceRequest**](CreatePreferenceRequest.md) |  |  |

### Return type

[**PreferenceResponse**](PreferenceResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_preference

> <PreferenceResponse> delete_preference(id)

Deletes an organization's preference for a project

Deletes the given `preference`. Once a preference is deleted, it cannot be undone. If you want to restore your previous preference, create a new one. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::PreferencesApi.new
id = 'id_example' # String | 

begin
  # Deletes an organization's preference for a project
  result = api_instance.delete_preference(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->delete_preference: #{e}"
end
```

#### Using the delete_preference_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PreferenceResponse>, Integer, Hash)> delete_preference_with_http_info(id)

```ruby
begin
  # Deletes an organization's preference for a project
  data, status_code, headers = api_instance.delete_preference_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PreferenceResponse>
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->delete_preference_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**PreferenceResponse**](PreferenceResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_preference

> <PreferenceResponse> retrieve_preference(id)

Retrieve the preference

Retrieve the preference and project of an organization. You can only retrieve preferences associated with your organization. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::PreferencesApi.new
id = 'id_example' # String | 

begin
  # Retrieve the preference
  result = api_instance.retrieve_preference(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->retrieve_preference: #{e}"
end
```

#### Using the retrieve_preference_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PreferenceResponse>, Integer, Hash)> retrieve_preference_with_http_info(id)

```ruby
begin
  # Retrieve the preference
  data, status_code, headers = api_instance.retrieve_preference_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PreferenceResponse>
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->retrieve_preference_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**PreferenceResponse**](PreferenceResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_preferences

> <PreferenceListResponse> retrieve_preferences(opts)

Retrieves a list of preferences

Retrieves a list of preferences and associated projects of an organization. You can only retrieve preferences associated with your organization. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::PreferencesApi.new
opts = {
  page: 56 # Integer | 
}

begin
  # Retrieves a list of preferences
  result = api_instance.retrieve_preferences(opts)
  p result
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->retrieve_preferences: #{e}"
end
```

#### Using the retrieve_preferences_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PreferenceListResponse>, Integer, Hash)> retrieve_preferences_with_http_info(opts)

```ruby
begin
  # Retrieves a list of preferences
  data, status_code, headers = api_instance.retrieve_preferences_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PreferenceListResponse>
rescue Patch::ApiError => e
  puts "Error when calling PreferencesApi->retrieve_preferences_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **Integer** |  | [optional] |

### Return type

[**PreferenceListResponse**](PreferenceListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

