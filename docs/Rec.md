# Patch::Rec

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by rec_prod or rec_test depending on the mode it was created in. |  |
| **allocated_energy_wh** | **Integer** | The amount of energy in Wh already allocated from this REC. |  |
| **energy_wh** | **Integer** | The amount of energy in Wh produced for this REC. |  |
| **price_cents_usd** | **Integer** | The total price in cents USD of this REC. |  |
| **production** | **Boolean** | A boolean indicating if this REC is a production or test mode REC. |  |
| **serial_number** | **String** | The serial number for this offset. |  |
| **vintage_year** | **Integer** |  |  |
| **project_id** | **String** |  |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Rec.new(
  id: null,
  allocated_energy_wh: null,
  energy_wh: null,
  price_cents_usd: null,
  production: null,
  serial_number: null,
  vintage_year: null,
  project_id: null
)
```

