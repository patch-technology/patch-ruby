# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

