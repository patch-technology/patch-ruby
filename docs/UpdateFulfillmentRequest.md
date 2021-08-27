# Patch::UpdateFulfillmentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **proof_data** | **Object** | An optional JSON object containing metadata for this order. | [optional] |
| **state** | **String** | The current state of the fulfillment. | [optional] |
| **reject_reason** | **String** | The reason this fulfillment was rejected. | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::UpdateFulfillmentRequest.new(
  proof_data: null,
  state: null,
  reject_reason: null
)
```

