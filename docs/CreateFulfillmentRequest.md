# Patch::CreateFulfillmentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_id** | **String** |  |  |
| **amount** | **Integer** |  |  |
| **proof_data** | **Object** | An optional JSON object containing metadata for this order. | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreateFulfillmentRequest.new(
  project_id: null,
  amount: null,
  proof_data: null
)
```

