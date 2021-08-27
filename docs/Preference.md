# Patch::Preference

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique uid for the record. UIDs will be prepended by pre_prod or pre_test depending on the mode it was created in. |  |
| **allocation_percentage** | **Integer** | Percentage of total purchased offsets that should go to a project. Default is 100%. |  |
| **project** | [**Project**](Project.md) | An object returning the Project record this Preference is associated with. See the [Project section](/?id&#x3D;projects) for the full schema. |  |

## Example

```ruby
require 'patch_ruby'

instance = Patch::Preference.new(
  id: null,
  allocation_percentage: null,
  project: null
)
```

