=begin
#Patch API V2

#The core API used to integrate with Patch's service

The version of the OpenAPI document: 2
Contact: engineering@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'cgi'

module Patch
  class OrderLineItemsApi
    OPERATIONS = [
      :create_order_line_item,
      :delete_order_line_item,
      :update_order_line_item,
    ]

    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Creates an order line item
    # Creates a line item on an order that is in the `draft` state. 
    # @param order_id [String] 
    # @param create_order_line_item_request [CreateOrderLineItemRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :patch_version 
    # @return [OrderLineItemResponse]
    def create_order_line_item(order_id, create_order_line_item_request = {}, opts = {})
      _create_order_line_item_request = Patch::CreateOrderLineItemRequest.new(create_order_line_item_request) 
      data, _status_code, _headers = create_order_line_item_with_http_info(order_id, _create_order_line_item_request, opts)
      data
    end

    # Creates an order line item
    # Creates a line item on an order that is in the `draft` state. 
    # @param order_id [String] 
    # @param create_order_line_item_request [CreateOrderLineItemRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :patch_version 
    # @return [Array<(OrderLineItemResponse, Integer, Hash)>] OrderLineItemResponse data, response status code and response headers
    def create_order_line_item_with_http_info(order_id, create_order_line_item_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OrderLineItemsApi.create_order_line_item ...'
      end
      # verify the required parameter 'order_id' is set
      if @api_client.config.client_side_validation && order_id.nil?
        fail ArgumentError, "Missing the required parameter 'order_id' when calling OrderLineItemsApi.create_order_line_item"
      end
      # verify the required parameter 'create_order_line_item_request' is set
      if @api_client.config.client_side_validation && create_order_line_item_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_order_line_item_request' when calling OrderLineItemsApi.create_order_line_item"
      end
      # resource path
      local_var_path = '/v1/orders/{order_id}/line_items'.sub('{' + 'order_id' + '}', CGI.escape(order_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end
      header_params['Patch-Version'] = 2
      header_params[:'Patch-Version'] = opts[:'patch_version'] if !opts[:'patch_version'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(create_order_line_item_request)

      # return_type
      return_type = opts[:debug_return_type] || 'OrderLineItemResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :operation => :"OrderLineItemsApi.create_order_line_item",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrderLineItemsApi#create_order_line_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Deletes an order line item
    # Deletes a line item on an order that is in the `draft` state. 
    # @param order_id [String] 
    # @param serial_number [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :patch_version 
    # @return [DeleteOrderLineItemResponse]
    def delete_order_line_item(order_id, serial_number, opts = {})
    
      data, _status_code, _headers = delete_order_line_item_with_http_info(order_id, serial_number, opts)
      data
    end

    # Deletes an order line item
    # Deletes a line item on an order that is in the `draft` state. 
    # @param order_id [String] 
    # @param serial_number [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :patch_version 
    # @return [Array<(DeleteOrderLineItemResponse, Integer, Hash)>] DeleteOrderLineItemResponse data, response status code and response headers
    def delete_order_line_item_with_http_info(order_id, serial_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OrderLineItemsApi.delete_order_line_item ...'
      end
      # verify the required parameter 'order_id' is set
      if @api_client.config.client_side_validation && order_id.nil?
        fail ArgumentError, "Missing the required parameter 'order_id' when calling OrderLineItemsApi.delete_order_line_item"
      end
      # verify the required parameter 'serial_number' is set
      if @api_client.config.client_side_validation && serial_number.nil?
        fail ArgumentError, "Missing the required parameter 'serial_number' when calling OrderLineItemsApi.delete_order_line_item"
      end
      # resource path
      local_var_path = '/v1/orders/{order_id}/line_items/{serial_number}'.sub('{' + 'order_id' + '}', CGI.escape(order_id.to_s)).sub('{' + 'serial_number' + '}', CGI.escape(serial_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params['Patch-Version'] = 2
      header_params[:'Patch-Version'] = opts[:'patch_version'] if !opts[:'patch_version'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'DeleteOrderLineItemResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :operation => :"OrderLineItemsApi.delete_order_line_item",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrderLineItemsApi#delete_order_line_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Updates an order line item
    # Updates a line item on an order that is in the `draft` state. 
    # @param order_id [String] 
    # @param serial_number [String] 
    # @param update_order_line_item_request [UpdateOrderLineItemRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :patch_version 
    # @return [OrderLineItemResponse]
    def update_order_line_item(order_id, serial_number, update_order_line_item_request = {}, opts = {})
      _update_order_line_item_request = Patch::UpdateOrderLineItemRequest.new(update_order_line_item_request) 
      data, _status_code, _headers = update_order_line_item_with_http_info(order_id, serial_number, _update_order_line_item_request, opts)
      data
    end

    # Updates an order line item
    # Updates a line item on an order that is in the `draft` state. 
    # @param order_id [String] 
    # @param serial_number [String] 
    # @param update_order_line_item_request [UpdateOrderLineItemRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :patch_version 
    # @return [Array<(OrderLineItemResponse, Integer, Hash)>] OrderLineItemResponse data, response status code and response headers
    def update_order_line_item_with_http_info(order_id, serial_number, update_order_line_item_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OrderLineItemsApi.update_order_line_item ...'
      end
      # verify the required parameter 'order_id' is set
      if @api_client.config.client_side_validation && order_id.nil?
        fail ArgumentError, "Missing the required parameter 'order_id' when calling OrderLineItemsApi.update_order_line_item"
      end
      # verify the required parameter 'serial_number' is set
      if @api_client.config.client_side_validation && serial_number.nil?
        fail ArgumentError, "Missing the required parameter 'serial_number' when calling OrderLineItemsApi.update_order_line_item"
      end
      # verify the required parameter 'update_order_line_item_request' is set
      if @api_client.config.client_side_validation && update_order_line_item_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_order_line_item_request' when calling OrderLineItemsApi.update_order_line_item"
      end
      # resource path
      local_var_path = '/v1/orders/{order_id}/line_items/{serial_number}'.sub('{' + 'order_id' + '}', CGI.escape(order_id.to_s)).sub('{' + 'serial_number' + '}', CGI.escape(serial_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end
      header_params['Patch-Version'] = 2
      header_params[:'Patch-Version'] = opts[:'patch_version'] if !opts[:'patch_version'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_order_line_item_request)

      # return_type
      return_type = opts[:debug_return_type] || 'OrderLineItemResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearer_auth']

      new_options = opts.merge(
        :operation => :"OrderLineItemsApi.update_order_line_item",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OrderLineItemsApi#update_order_line_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end