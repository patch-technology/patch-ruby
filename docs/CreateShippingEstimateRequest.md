# Patch::CreateShippingEstimateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **distance_m** | **Integer** |  |  |
| **package_mass_g** | **Integer** |  |  |
| **transportation_method** | **String** |  |  |
| **project_id** | **String** |  | [optional] |
| **create_order** | **Boolean** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateShippingEstimateRequest.new(
  distance_m: null,
  package_mass_g: null,
  transportation_method: null,
  project_id: null,
  create_order: null
)
```

