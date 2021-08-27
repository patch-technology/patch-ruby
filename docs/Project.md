# Patch::Project

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by pro_prod or pro_test depending on the mode it was created in. |  |
| **production** | **Boolean** | A boolean indicating if this project is a production or test mode project. |  |
| **name** | **String** | The name of the project. |  |
| **description** | **String** | The description of the project. |  |
| **type** | **String** | The type of carbon removal project, currently available project types are Biomass, Dac, Forestry, Mineralization, Ocean, Renewables, Soil. | [optional] |
| **country** | **String** | The country of origin of the project. |  |
| **developer** | **String** | The name of the project developer. |  |
| **photos** | [**Array&lt;Photo&gt;**](Photo.md) | An array of URLs for photos of the project. | [optional] |
| **average_price_per_tonne_cents_usd** | **Integer** | The average price per tonne in USD cents for carbon offsets supplied by this project. |  |
| **remaining_mass_g** | **Integer** | The remaining mass in grams available for purchase for this project. |  |
| **standard** | [**Standard**](Standard.md) | An object returning the Standard associated with this project. | [optional] |
| **sdgs** | [**Array&lt;Sdg&gt;**](Sdg.md) | An array returning the UN Sustainable Development Goals associated with this project. | [optional] |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Project.new(
  id: null,
  production: null,
  name: null,
  description: null,
  type: null,
  country: null,
  developer: null,
  photos: null,
  average_price_per_tonne_cents_usd: null,
  remaining_mass_g: null,
  standard: null,
  sdgs: null
)
```

