# Patch::CreateVehicleEstimateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **distance_m** | **Integer** |  |  |
| **make** | **String** |  | [optional] |
| **model** | **String** |  | [optional] |
| **year** | **Integer** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **create_order** | **Boolean** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateVehicleEstimateRequest.new(
  distance_m: null,
  make: null,
  model: null,
  year: null,
  project_id: null,
  create_order: null
)
```

