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
  class PreferencesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # creates a project preference
    # Creates a project preference for the given organization. If you have a `preference` in place, all of your orders will be directed to the project the preference points to. 
    # @param [Hash] opts the optional parameters
    # @option opts [UNKNOWN_BASE_TYPE] :unknown_base_type 
    # @return [PreferenceResponse]
    def create_preference(opts = {})
      data, _status_code, _headers = create_preference_with_http_info(opts)
      data
    end

    # creates a project preference
    # Creates a project preference for the given organization. If you have a &#x60;preference&#x60; in place, all of your orders will be directed to the project the preference points to. 
    # @param [Hash] opts the optional parameters
    # @option opts [UNKNOWN_BASE_TYPE] :unknown_base_type 
    # @return [Array<(PreferenceResponse, Integer, Hash)>] PreferenceResponse data, response status code and response headers
    def create_preference_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PreferencesApi.create_preference ...'
      end
      # resource path
      local_var_path = '/v1/preferences'

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
      post_body = opts[:body] || @api_client.object_to_http_body(opts[:'unknown_base_type']) 

      # return_type
      return_type = opts[:return_type] || 'PreferenceResponse' 

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
        @api_client.config.logger.debug "API called: PreferencesApi#create_preference\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Deletes an organization's preference for a project
    # Deletes the given `preference`. Once a preference is deleted, it cannot be undone. If you want to restore your previous preference, create a new one. 
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [PreferenceResponse]
    def delete_preference(id, opts = {})
      data, _status_code, _headers = delete_preference_with_http_info(id, opts)
      data
    end

    # Deletes an organization&#39;s preference for a project
    # Deletes the given &#x60;preference&#x60;. Once a preference is deleted, it cannot be undone. If you want to restore your previous preference, create a new one. 
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(PreferenceResponse, Integer, Hash)>] PreferenceResponse data, response status code and response headers
    def delete_preference_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PreferencesApi.delete_preference ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PreferencesApi.delete_preference"
      end
      # resource path
      local_var_path = '/v1/preferences/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:return_type] || 'PreferenceResponse' 

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

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PreferencesApi#delete_preference\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve the preference
    # Retrieve the preference and project of an organization. You can only retrieve preferences associated with your organization. 
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [PreferenceResponse]
    def retrieve_preference(id, opts = {})
      data, _status_code, _headers = retrieve_preference_with_http_info(id, opts)
      data
    end

    # Retrieve the preference
    # Retrieve the preference and project of an organization. You can only retrieve preferences associated with your organization. 
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(PreferenceResponse, Integer, Hash)>] PreferenceResponse data, response status code and response headers
    def retrieve_preference_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PreferencesApi.retrieve_preference ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PreferencesApi.retrieve_preference"
      end
      # resource path
      local_var_path = '/v1/preferences/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:return_type] || 'PreferenceResponse' 

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
        @api_client.config.logger.debug "API called: PreferencesApi#retrieve_preference\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieves a list of preferences
    # Retrieves a list of preferences and associated projects of an organization. You can only retrieve preferences associated with your organization. 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [PreferenceListResponse]
    def retrieve_preferences(opts = {})
      data, _status_code, _headers = retrieve_preferences_with_http_info(opts)
      data
    end

    # Retrieves a list of preferences
    # Retrieves a list of preferences and associated projects of an organization. You can only retrieve preferences associated with your organization. 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :page 
    # @return [Array<(PreferenceListResponse, Integer, Hash)>] PreferenceListResponse data, response status code and response headers
    def retrieve_preferences_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PreferencesApi.retrieve_preferences ...'
      end
      # resource path
      local_var_path = '/v1/preferences'

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
      return_type = opts[:return_type] || 'PreferenceListResponse' 

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
        @api_client.config.logger.debug "API called: PreferencesApi#retrieve_preferences\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
