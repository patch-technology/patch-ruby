# PatchRuby::Order

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**mass_g** | **Integer** |  | [optional] 
**production** | **Boolean** |  | [optional] 
**state** | **String** |  | [optional] 
**allocation_state** | **String** |  | [optional] 
**price_cents_usd** | **String** |  | [optional] 
**allocations** | [**Array&lt;Allocation&gt;**](Allocation.md) |  | [optional] 

## Code Sample

```ruby
require 'PatchRuby'

instance = PatchRuby::Order.new(id: null,
                                 mass_g: null,
                                 production: null,
                                 state: null,
                                 allocation_state: null,
                                 price_cents_usd: null,
                                 allocations: null)
```


