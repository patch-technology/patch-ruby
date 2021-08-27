# Patch::Payout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The id of the record |  |
| **payout_cents_usd** | **Integer** | The payout amount in cents of USD |  |
| **state** | **String** | The current state of the payout. |  |
| **external_system** | **String** | The system of the record for the payout (e.g. \&quot;stripe\&quot;). | [optional] |
| **external_system_id** | **String** | The id of the payout in the system of record. | [optional] |
| **organization** | [**Organization**](Organization.md) | An object returning the Organization record this Payout is associated with. |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Payout.new(
  id: null,
  payout_cents_usd: null,
  state: null,
  external_system: null,
  external_system_id: null,
  organization: null
)
```

