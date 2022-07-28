# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.24.0] - 2022-07-22

### Added

- Adds `Patch::Estimate.create_air_shipping_estimate` method
- Adds `Patch::Estimate.create_rail_shipping_estimate` method
- Adds `Patch::Estimate.create_road_shipping_estimate` method
- Adds `Patch::Estimate.create_sea_shipping_estimate` method

## [1.23.0] - 2022-06-03

### Added

- Adds support for the `issued_to` parameter on `orders`, to add support for creating and placing orders on behalf of another party.

## [1.22.0] - 2022-05-16

### Added

- Adds support for the `accept_language` option on `projects`, to add support for the `Accept-Language` header.

## [1.21.0] - 2022-05-03

### Added

- Adds optional `total_price` and `currency` field to `order` creation
- Adds optional `amount` and `unit` field to `order` creation
- Adds inventory to `project` responses
- Adds inventory to `order` responses

### Changed

- Deprecates `mass_g` and `total_price_cents_usd` fields for create `order` requests
- Deprecates `average_price_per_tonne_cents_usd` and `remaining_mass_g` from `project` responses
- Deprecates `price_cents_usd`, `patch_fee_cents_usd`, and `mass_g` from `order` responses

## [1.20.0] - 2022-04-18

### Added

- Adds optional `vintage_year` field to `order` creation

## [1.19.0] - 2022-04-05

### Added

- Adds `Patch::Estimate.create_hotel_estimate` method

## [1.18.0] - 2022-03-22

### Changed

- Adds optional `state` field to `order` creation

## [1.17.0] - 2022-01-11

### Changed

- Set the order allocatations array as optional.

## [1.16.1] - 2022-01-07

### Changed

- No feature changes. Updates the openapi-generator version.

## [1.16.0] - 2021-12-07

### Removed

- Removes the `preferences` endpoints (deprecated)

## [1.15.2] - 2021-11-08

### Added

- Adds highlights to project responses

## [1.15.1] - 2021-11-04

### Added

- Adds verifier to project responses

## [1.15.0] - 2021-10-04

### Added

- Added the ability to fetch project technology types via `Patch::TechnologyType.retrieve_technology_types()`

## [1.14.0] - 2021-09-21

### Added

- Adds mechanism, tagline, state, latitude, longitude, and technology_type to project responses

## [1.13.0] - 2021-09-10

### Added

- Adds ability to create Bitcoin and Ethereum estimates using the daily balance held.

## [1.12.0] - 2021-09-08

### Added

- Adds a `created_at` attribute in all order responses

## [1.11.1] - 2021-09-07

### Changed

- Body parameters are validated before being sent to the API. This gives developers faster feedback as they develop their applications.

## [1.11.0] - 2021-09-07

### Added

- Adds support for airports, aircracts, cabin class and passenger count in flight estimates

## [1.10.2] - 2021-09-01

### Fixed

- Allows methods to be called with no parameters

## [1.10.0] - 2021-08-27

### Added

- Adds custom User-Agent header

## [1.9.0] - 2021-08-17

### Added

- Add support for querying Orders by `metadata`
- Added `transaction_value_eth_gwei` as an alternative way to compute transaction level emissions for ethereum

## [1.8.0] - 2021-07-20

### Added

- Add support for Ethereum estimates

## [1.7.0] - 2021-07-14

### Changed

- [BREAKING] Changed `order.price_cents_usd` and `order.patch_fee_cents_usd` from string to integer.

## [1.6.0] - 2021-07-14

### Added

- Order responses return a `registry_url` field
- Add support for Bitcoin estimates

## [1.5.2] - 2021-03-30

### Changed

- Updated the value validation for certain parameters to match the API
- Added the `renewables` type

## [1.5.1] - 2021-03-02

### Fixed

- Fixed a `NameError` that was thrown when `Patch::Sdg` was called. Specs have been added to ensure this does not happen again.

## [1.5.0] - 2021-03-01

### Changed

- Changed base URL from https://api.usepatch.com to https://api.patch.io

## [1.4.0] - 2021-02-15

### Added

- Adds Sustainable Development Goals (SDGs) field to projects
- Adds filtering to Projects by country, type, minimum_available_mass

### Changed

- vehicle estimates now support optional `make`, `model` and `year` fields.

## [1.3.0] - 2021-02-08

### Added

- Adds support for creating carbon emission estimates for flights, shipping, and vehicles. See the [docs](https://docs.patch.io/#/?id=estimates) for more information.

## [1.2.5] - 2020-01-08

### Fixed

- Fixes [issues/5](https://github.com/patch-technology/patch-ruby/issues/5). Adds method `.openapi_nullable` which returns a set with all nullable properties. This method is referenced in `#to_hash` which returns a hash representation of the resource.
- Removes non-deterministic integration spec that is creating an Estimate with a specific project-id. Since we do not control the test data (yet) and make queries against our Test projects, we cannot be sure that we will have offsets available for a project ID. Instead we can rely on Patch core specs to cover this.
- Fixes a spec that was failing due to a Patch core change.
- Add spec factories and refactor generated method specs to shared examples.

## [1.2.4] - 2020-10-14

### Added

- `total_price_cents_usd` field to `orders`
- allows users to create an order by total price

### Changed

- order creation requires either `mass_g` or `total_price_cents_usd`, but not both

## [1.2.3] - 2020-10-05

### Added

- `patch_fee_cents_usd` field to `orders`

## [1.2.2] - 2020-09-18

### Added

- `photos` field to `projects`

## [1.2.1] - 2020-09-18

### Fixed

- Fixing an issue related to the OpenApi code generator.

## [1.2.0] - 2020-09-17

### Added

- `average_price_per_tonne_cents_usd` field to `projects`
- `remaining_mass_g` field to `projects`
- `standard` field to `projects`
- validations on `mass_g` field (has to be greater than 1 and less than 2,000,000,000).

## [1.1.0] - 2020-08-19

### Added

- `project_id` optional field to `order` creation
- `metadata` optional field to `order` creation
- `project_id` optional field to `estimate` creation
- changelog file

## [1.0.0] - 2020-07-05

### Added

- This is the first official release of Patch's Ruby Gem.

## [1.0.0.pre] - 2020-07-02

### Added

- Pre-release of v1 Gem
- Adds support for Orders, Estimates, Projects and Preferences
