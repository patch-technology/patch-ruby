# Patch::CreateEthereumEstimateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **timestamp** | **String** |  | [optional] |
| **gas_used** | **Integer** |  | [optional] |
| **transaction_value_eth_gwei** | **Integer** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **create_order** | **Boolean** |  | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateEthereumEstimateRequest.new(
  timestamp: null,
  gas_used: null,
  transaction_value_eth_gwei: null,
  project_id: null,
  create_order: null
)
```

