# PatchRuby::ProjectsApi

All URIs are relative to *https://api.usepatch.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**retrieve_project**](ProjectsApi.md#retrieve_project) | **GET** /v1/projects/{id} | Retrieves a project
[**retrieve_projects**](ProjectsApi.md#retrieve_projects) | **GET** /v1/projects | Retrieves a list of projects



## retrieve_project

> ProjectResponse retrieve_project(id)

Retrieves a project

Retrieves a project available on Patch's platform. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::ProjectsApi.new
id = 'id_example' # String | 

begin
  #Retrieves a project
  result = api_instance.retrieve_project(id)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling ProjectsApi->retrieve_project: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ProjectResponse**](ProjectResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_projects

> ProjectListResponse retrieve_projects(opts)

Retrieves a list of projects

Retrieves a list of projects available for purchase on Patch's platform. 

### Example

```ruby
# load the gem
require 'patch_ruby'
# setup authorization
PatchRuby.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PatchRuby::ProjectsApi.new
opts = {
  page: 56 # Integer | 
}

begin
  #Retrieves a list of projects
  result = api_instance.retrieve_projects(opts)
  p result
rescue PatchRuby::ApiError => e
  puts "Exception when calling ProjectsApi->retrieve_projects: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Integer**|  | [optional] 

### Return type

[**ProjectListResponse**](ProjectListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

