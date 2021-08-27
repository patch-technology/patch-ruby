# Patch::Allocation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by all_prod or all_test depending on the mode it was created in. |  |
| **production** | **Boolean** | A boolean indicating if this project is a production or test mode project. |  |
| **mass_g** | **Integer** | The amount (in grams) of allocated carbon offsets. |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Allocation.new(
  id: null,
  production: null,
  mass_g: null
)
```

