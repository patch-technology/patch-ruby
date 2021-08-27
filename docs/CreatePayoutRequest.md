# Patch::CreatePayoutRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **organization_id** | **String** |  | [optional] |
| **state** | **String** | The current state of the payout. | [optional] |
| **payout_cents_usd** | **Integer** |  | [optional] |
| **external_system** | **String** | The system of the record for the payout (e.g. \&quot;stripe\&quot;). | [optional] |
| **external_system_id** | **String** | The id of the payout in the system of record. | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::CreatePayoutRequest.new(
  organization_id: null,
  state: null,
  payout_cents_usd: null,
  external_system: null,
  external_system_id: null
)
```

