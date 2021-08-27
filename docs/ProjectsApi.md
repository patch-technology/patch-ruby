# Patch::ProjectsApi

All URIs are relative to *https://api.patch.io*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**retrieve_project**](ProjectsApi.md#retrieve_project) | **GET** /v1/projects/{id} | Retrieves a project |
| [**retrieve_projects**](ProjectsApi.md#retrieve_projects) | **GET** /v1/projects | Retrieves a list of projects |


## retrieve_project

> <ProjectResponse> retrieve_project(id)

Retrieves a project

Retrieves a project available on Patch's platform. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::ProjectsApi.new
id = 'id_example' # String | 

begin
  # Retrieves a project
  result = api_instance.retrieve_project(id)
  p result
rescue Patch::ApiError => e
  puts "Error when calling ProjectsApi->retrieve_project: #{e}"
end
```

#### Using the retrieve_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProjectResponse>, Integer, Hash)> retrieve_project_with_http_info(id)

```ruby
begin
  # Retrieves a project
  data, status_code, headers = api_instance.retrieve_project_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProjectResponse>
rescue Patch::ApiError => e
  puts "Error when calling ProjectsApi->retrieve_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**ProjectResponse**](ProjectResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retrieve_projects

> <ProjectListResponse> retrieve_projects(opts)

Retrieves a list of projects

Retrieves a list of projects available for purchase on Patch's platform. 

### Examples

```ruby
require 'time'
require 'patch_ruby'
# setup authorization
Patch.configure do |config|
  # Configure Bearer authorization: bearer_auth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Patch::ProjectsApi.new
opts = {
  page: 56, # Integer | 
  country: 'country_example', # String | 
  type: 'type_example', # String | 
  minimum_available_mass: 56 # Integer | 
}

begin
  # Retrieves a list of projects
  result = api_instance.retrieve_projects(opts)
  p result
rescue Patch::ApiError => e
  puts "Error when calling ProjectsApi->retrieve_projects: #{e}"
end
```

#### Using the retrieve_projects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProjectListResponse>, Integer, Hash)> retrieve_projects_with_http_info(opts)

```ruby
begin
  # Retrieves a list of projects
  data, status_code, headers = api_instance.retrieve_projects_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProjectListResponse>
rescue Patch::ApiError => e
  puts "Error when calling ProjectsApi->retrieve_projects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **Integer** |  | [optional] |
| **country** | **String** |  | [optional] |
| **type** | **String** |  | [optional] |
| **minimum_available_mass** | **Integer** |  | [optional] |

### Return type

[**ProjectListResponse**](ProjectListResponse.md)

### Authorization

[bearer_auth](../README.md#bearer_auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

