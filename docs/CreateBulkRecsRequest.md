# Patch::CreateBulkRecsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **price_cents_usd** | **Integer** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **vintage_year** | **Integer** |  | [optional] |
| **serial_number** | **String** |  | [optional] |
| **count** | **Integer** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateBulkRecsRequest.new(
  price_cents_usd: null,
  project_id: null,
  vintage_year: null,
  serial_number: null,
  count: null
)
```

