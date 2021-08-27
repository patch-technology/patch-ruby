# Patch::Offset

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by off_prod or off_test depending on the mode it was created in. |  |
| **allocated_mass_g** | **Integer** | The amount of carbon offset mass in grams already allocated from this offset. |  |
| **mass_g** | **Integer** | The amount of carbon offsets in grams for this offset. |  |
| **price_cents_usd** | **Integer** | The total price in cents USD of this carbon offset. |  |
| **production** | **Boolean** | A boolean indicating if this offset is a production or test mode offset. |  |
| **retired** | **Boolean** |  |  |
| **serial_number** | **String** | The serial number for this offset. |  |
| **vintage_year** | **Integer** |  |  |
| **project_id** | **String** |  |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Offset.new(
  id: null,
  allocated_mass_g: null,
  mass_g: null,
  price_cents_usd: null,
  production: null,
  retired: null,
  serial_number: null,
  vintage_year: null,
  project_id: null
)
```

