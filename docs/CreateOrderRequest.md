# Patch::CreateOrderRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mass_g** | **Integer** |  | [optional] |
| **total_price_cents_usd** | **Integer** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **metadata** | **Object** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateOrderRequest.new(
  mass_g: null,
  total_price_cents_usd: null,
  project_id: null,
  metadata: null
)
```

