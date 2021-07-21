=begin
#Patch API V1

#The core API used to integrate with Patch's service

The version of the OpenAPI document: v1
Contact: developers@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'cgi'

module Patch
  class EstimatesApi
    OPERATIONS = [
      :create_bitcoin_estimate,
      :create_ethereum_estimate,
      :create_flight_estimate,
      :create_mass_estimate,
      :create_shipping_estimate,
      :create_vehicle_estimate,
      :retrieve_estimate,
      :retrieve_estimates,
    ]

    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create a bitcoin estimate given a timestamp and transaction value
    # Creates a bitcoin estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters, linked to the estimate. 
    # @param create_bitcoin_estimate_request [CreateBitcoinEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def create_bitcoin_estimate(create_bitcoin_estimate_request, opts = {})
      data, _status_code, _headers = create_bitcoin_estimate_with_http_info(create_bitcoin_estimate_request, opts)
      data
    end

    # Create a bitcoin estimate given a timestamp and transaction value
    # Creates a bitcoin estimate for the amount of CO2 to be compensated. An order in the &#x60;draft&#x60; state may be created based on the parameters, linked to the estimate. 
    # @param create_bitcoin_estimate_request [CreateBitcoinEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def create_bitcoin_estimate_with_http_info(create_bitcoin_estimate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.create_bitcoin_estimate ...'
      end
      # verify the required parameter 'create_bitcoin_estimate_request' is set
      if @api_client.config.client_side_validation && create_bitcoin_estimate_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_bitcoin_estimate_request' when calling EstimatesApi.create_bitcoin_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/crypto/btc'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(create_bitcoin_estimate_request) 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#create_bitcoin_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create an ethereum estimate given a timestamp and gas used
    # Creates an ethereum estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters, linked to the estimate. 
    # @param create_ethereum_estimate_request [CreateEthereumEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def create_ethereum_estimate(create_ethereum_estimate_request, opts = {})
      data, _status_code, _headers = create_ethereum_estimate_with_http_info(create_ethereum_estimate_request, opts)
      data
    end

    # Create an ethereum estimate given a timestamp and gas used
    # Creates an ethereum estimate for the amount of CO2 to be compensated. An order in the &#x60;draft&#x60; state may be created based on the parameters, linked to the estimate. 
    # @param create_ethereum_estimate_request [CreateEthereumEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def create_ethereum_estimate_with_http_info(create_ethereum_estimate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.create_ethereum_estimate ...'
      end
      # verify the required parameter 'create_ethereum_estimate_request' is set
      if @api_client.config.client_side_validation && create_ethereum_estimate_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_ethereum_estimate_request' when calling EstimatesApi.create_ethereum_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/crypto/eth'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(create_ethereum_estimate_request) 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#create_ethereum_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a flight estimate given the distance traveled in meters
    # Creates a flight estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters, linked to the estimate. 
    # @param create_flight_estimate_request [CreateFlightEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def create_flight_estimate(create_flight_estimate_request, opts = {})
      data, _status_code, _headers = create_flight_estimate_with_http_info(create_flight_estimate_request, opts)
      data
    end

    # Create a flight estimate given the distance traveled in meters
    # Creates a flight estimate for the amount of CO2 to be compensated. An order in the &#x60;draft&#x60; state may be created based on the parameters, linked to the estimate. 
    # @param create_flight_estimate_request [CreateFlightEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def create_flight_estimate_with_http_info(create_flight_estimate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.create_flight_estimate ...'
      end
      # verify the required parameter 'create_flight_estimate_request' is set
      if @api_client.config.client_side_validation && create_flight_estimate_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_flight_estimate_request' when calling EstimatesApi.create_flight_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/flight'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(create_flight_estimate_request) 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#create_flight_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create an estimate based on mass of CO2
    # Creates an estimate for the mass of CO2 to be compensated. An order in the `draft` state will also be created, linked to the estimate. 
    # @param create_mass_estimate_request [CreateMassEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def create_mass_estimate(create_mass_estimate_request, opts = {})
      data, _status_code, _headers = create_mass_estimate_with_http_info(create_mass_estimate_request, opts)
      data
    end

    # Create an estimate based on mass of CO2
    # Creates an estimate for the mass of CO2 to be compensated. An order in the &#x60;draft&#x60; state will also be created, linked to the estimate. 
    # @param create_mass_estimate_request [CreateMassEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def create_mass_estimate_with_http_info(create_mass_estimate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.create_mass_estimate ...'
      end
      # verify the required parameter 'create_mass_estimate_request' is set
      if @api_client.config.client_side_validation && create_mass_estimate_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_mass_estimate_request' when calling EstimatesApi.create_mass_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/mass'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(create_mass_estimate_request) 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#create_mass_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a shipping estimate given the distance traveled in meters, package weight, and transportation method.
    # Creates a shipping estimate for the amount of CO2 to be compensated. An order in the `draft` state may be created based on the parameters. 
    # @param create_shipping_estimate_request [CreateShippingEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def create_shipping_estimate(create_shipping_estimate_request, opts = {})
      data, _status_code, _headers = create_shipping_estimate_with_http_info(create_shipping_estimate_request, opts)
      data
    end

    # Create a shipping estimate given the distance traveled in meters, package weight, and transportation method.
    # Creates a shipping estimate for the amount of CO2 to be compensated. An order in the &#x60;draft&#x60; state may be created based on the parameters. 
    # @param create_shipping_estimate_request [CreateShippingEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def create_shipping_estimate_with_http_info(create_shipping_estimate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.create_shipping_estimate ...'
      end
      # verify the required parameter 'create_shipping_estimate_request' is set
      if @api_client.config.client_side_validation && create_shipping_estimate_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_shipping_estimate_request' when calling EstimatesApi.create_shipping_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/shipping'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(create_shipping_estimate_request) 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#create_shipping_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a vehicle estimate given the distance traveled in meters and the type of vehicle
    # Creates an estimate and calculates the amount of CO2 to be compensated depending on the distance and the vehicle. An order in the `draft` state may be created based on the parameters, linked to the estimate. 
    # @param create_vehicle_estimate_request [CreateVehicleEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def create_vehicle_estimate(create_vehicle_estimate_request, opts = {})
      data, _status_code, _headers = create_vehicle_estimate_with_http_info(create_vehicle_estimate_request, opts)
      data
    end

    # Create a vehicle estimate given the distance traveled in meters and the type of vehicle
    # Creates an estimate and calculates the amount of CO2 to be compensated depending on the distance and the vehicle. An order in the &#x60;draft&#x60; state may be created based on the parameters, linked to the estimate. 
    # @param create_vehicle_estimate_request [CreateVehicleEstimateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def create_vehicle_estimate_with_http_info(create_vehicle_estimate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.create_vehicle_estimate ...'
      end
      # verify the required parameter 'create_vehicle_estimate_request' is set
      if @api_client.config.client_side_validation && create_vehicle_estimate_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_vehicle_estimate_request' when calling EstimatesApi.create_vehicle_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/vehicle'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(create_vehicle_estimate_request) 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#create_vehicle_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieves an estimate
    # Retrieves a given estimate and its associated order. You can only retrieve estimates associated with the organization you are querying for. 
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [EstimateResponse]
    def retrieve_estimate(id, opts = {})
      data, _status_code, _headers = retrieve_estimate_with_http_info(id, opts)
      data
    end

    # Retrieves an estimate
    # Retrieves a given estimate and its associated order. You can only retrieve estimates associated with the organization you are querying for. 
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(EstimateResponse, Integer, Hash)>] EstimateResponse data, response status code and response headers
    def retrieve_estimate_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.retrieve_estimate ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EstimatesApi.retrieve_estimate"
      end
      # resource path
      local_var_path = '/v1/estimates/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'EstimateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#retrieve_estimate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieves a list of estimates
    # Retrieves a list of estimates and their associated orders. You can only retrieve estimates associated with the organization you are querying for. 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [EstimateListResponse]
    def retrieve_estimates(opts = {})
      data, _status_code, _headers = retrieve_estimates_with_http_info(opts)
      data
    end

    # Retrieves a list of estimates
    # Retrieves a list of estimates and their associated orders. You can only retrieve estimates associated with the organization you are querying for. 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [Array<(EstimateListResponse, Integer, Hash)>] EstimateListResponse data, response status code and response headers
    def retrieve_estimates_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EstimatesApi.retrieve_estimates ...'
      end
      # resource path
      local_var_path = '/v1/estimates'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'EstimateListResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EstimatesApi#retrieve_estimates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
