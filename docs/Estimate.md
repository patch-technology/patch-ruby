# Patch::Estimate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by est_prod or est_test depending on the mode it was created in. |  |
| **production** | **Boolean** | A boolean indicating if this estimate is a production or test mode estimate. |  |
| **type** | **String** | The type of estimate. Available types are mass, flight, shipping, vehicle, and crypto. |  |
| **mass_g** | **Integer** | The estimated mass in grams for this estimate. | [optional] |
| **order** | [**Order**](Order.md) | An object returning the order associated with this estimate. See the [Order section](/?id&#x3D;orders) for the full schema. | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Estimate.new(
  id: null,
  production: null,
  type: null,
  mass_g: null,
  order: null
)
```

