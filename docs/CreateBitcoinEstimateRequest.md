# Patch::CreateBitcoinEstimateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **timestamp** | **String** |  | [optional] |
| **transaction_value_btc_sats** | **Integer** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **create_order** | **Boolean** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateBitcoinEstimateRequest.new(
  timestamp: null,
  transaction_value_btc_sats: null,
  project_id: null,
  create_order: null
)
```

