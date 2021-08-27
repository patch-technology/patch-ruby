# Patch::Fulfillment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The id of the record |  |
| **amount** | **Integer** | The amount of allocatables in grams/Wh to fulfill. |  |
| **state** | **String** | The current state of the fulfillment. |  |
| **reject_reason** | **String** | The reason this fulfillment was rejected. | [optional] |
| **proof_data** | **Object** | An optional JSON object containing metadata for this order. | [optional] |
| **fulfillment_documents** | [**Array&lt;FulfillmentDocument&gt;**](FulfillmentDocument.md) | An array of URLs for fulfillment documents for the fulfillment. | [optional] |
| **project** | [**Project**](Project.md) | An object returning the Project record this Fulfillment is associated with. |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Fulfillment.new(
  id: null,
  amount: null,
  state: null,
  reject_reason: null,
  proof_data: null,
  fulfillment_documents: null,
  project: null
)
```

