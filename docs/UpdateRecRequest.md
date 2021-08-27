# Patch::UpdateRecRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **energy_wh** | **Integer** |  | [optional] |
| **price_cents_usd** | **Integer** |  | [optional] |
| **vintage_year** | **Integer** |  | [optional] |
| **serial_number** | **String** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::UpdateRecRequest.new(
  energy_wh: null,
  price_cents_usd: null,
  vintage_year: null,
  serial_number: null
)
```

