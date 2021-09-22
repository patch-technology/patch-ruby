=begin
#Patch API V1

#The core API used to integrate with Patch's service

The version of the OpenAPI document: v1
Contact: developers@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.2.1

=end

# Common files
require 'patch_ruby/api_client'
require 'patch_ruby/api_error'
require 'patch_ruby/version'
require 'patch_ruby/configuration'

# Models
require 'patch_ruby/models/allocation'
require 'patch_ruby/models/create_bitcoin_estimate_request'
require 'patch_ruby/models/create_ethereum_estimate_request'
require 'patch_ruby/models/create_flight_estimate_request'
require 'patch_ruby/models/create_mass_estimate_request'
require 'patch_ruby/models/create_order_request'
require 'patch_ruby/models/create_preference_request'
require 'patch_ruby/models/create_shipping_estimate_request'
require 'patch_ruby/models/create_success_response'
require 'patch_ruby/models/create_vehicle_estimate_request'
require 'patch_ruby/models/error_response'
require 'patch_ruby/models/estimate'
require 'patch_ruby/models/estimate_list_response'
require 'patch_ruby/models/estimate_response'
require 'patch_ruby/models/meta_index_object'
require 'patch_ruby/models/order'
require 'patch_ruby/models/order_list_response'
require 'patch_ruby/models/order_response'
require 'patch_ruby/models/parent_technology_type'
require 'patch_ruby/models/photo'
require 'patch_ruby/models/preference'
require 'patch_ruby/models/preference_list_response'
require 'patch_ruby/models/preference_response'
require 'patch_ruby/models/project'
require 'patch_ruby/models/project_list_response'
require 'patch_ruby/models/project_response'
require 'patch_ruby/models/sdg'
require 'patch_ruby/models/standard'
require 'patch_ruby/models/technology_type'

# APIs
require 'patch_ruby/api/estimates_api'
require 'patch_ruby/api/orders_api'
require 'patch_ruby/api/preferences_api'
require 'patch_ruby/api/projects_api'

module Patch
  class << self
    # Customize default settings for the SDK using block.
    #   Patch.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
