# PatchRuby::PreferencesApi

All URIs are relative to *https://api.usepatch.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_preference**](PreferencesApi.md#create_preference) | **POST** /v1/preferences | creates a project preference
[**delete_preference**](PreferencesApi.md#delete_preference) | **DELETE** /v1/preferences/{id} | Deletes an organization&#39;s preference for a project
[**retrieve_preference**](PreferencesApi.md#retrieve_preference) | **GET** /v1/preferences/{id} | Retrieve the preference
[**retrieve_preferences**](PreferencesApi.md#retrieve_preferences) | **GET** /v1/preferences | Retrieves a list of preferences



## create_preference

> PreferenceResponse create_preference(opts)

creates a project preference

Creates a project preference for the given organization. If you have a `preference` in place, all of your orders will be directed to the project the preference points to. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::PreferencesApi.new
opts = {
  unknown_base_type: PatchRuby::UNKNOWN_BASE_TYPE.new # UNKNOWN_BASE_TYPE | 
}

begin
  #creates a project preference
  result = api_instance.create_preference(opts)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling PreferencesApi->create_preference: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unknown_base_type** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md)|  | [optional] 

### Return type

[**PreferenceResponse**](PreferenceResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_preference

> PreferenceResponse delete_preference(id)

Deletes an organization's preference for a project

Deletes the given `preference`. Once a preference is deleted, it cannot be undone. If you want to restore your previous preference, create a new one. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::PreferencesApi.new
id = 'id_example' # String | 

begin
  #Deletes an organization's preference for a project
  result = api_instance.delete_preference(id)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling PreferencesApi->delete_preference: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**PreferenceResponse**](PreferenceResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_preference

> PreferenceResponse retrieve_preference(id)

Retrieve the preference

Retrieve the preference and project of an organization. You can only retrieve preferences associated with your organization. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::PreferencesApi.new
id = 'id_example' # String | 

begin
  #Retrieve the preference
  result = api_instance.retrieve_preference(id)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling PreferencesApi->retrieve_preference: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**PreferenceResponse**](PreferenceResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_preferences

> PreferenceListResponse retrieve_preferences(opts)

Retrieves a list of preferences

Retrieves a list of preferences and associated projects of an organization. You can only retrieve preferences associated with your organization. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::PreferencesApi.new
opts = {
  page: 56 # Integer | 
}

begin
  #Retrieves a list of preferences
  result = api_instance.retrieve_preferences(opts)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling PreferencesApi->retrieve_preferences: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Integer**|  | [optional] 

### Return type

[**PreferenceListResponse**](PreferenceListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

