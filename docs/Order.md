# Patch::Order

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by ord_prod or ord_test depending on the mode it was created in. |  |
| **mass_g** | **Integer** | The amount of carbon offsets in grams purchased through this order. |  |
| **production** | **Boolean** | A boolean indicating if this order is a production or test mode order. |  |
| **state** | **String** | The current state of the order. |  |
| **allocation_state** | **String** | The current state of the allocated carbon offsets of the order. |  |
| **price_cents_usd** | **Integer** | The total price in cents USD of the carbon offsets purchased through this order. |  |
| **patch_fee_cents_usd** | **Integer** | The Patch Fee in cents USD for this order. |  |
| **allocations** | [**Array&lt;Allocation&gt;**](Allocation.md) | An array containing the inventory allocations for this order. |  |
| **registry_url** | **String** | The url of this order in the public registry. | [optional] |
| **metadata** | **Object** | An optional JSON object containing metadata for this order. |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Order.new(
  id: null,
  mass_g: null,
  production: null,
  state: null,
  allocation_state: null,
  price_cents_usd: null,
  patch_fee_cents_usd: null,
  allocations: null,
  registry_url: null,
  metadata: null
)
```

