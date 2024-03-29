=begin
#Patch API V2

#The core API used to integrate with Patch's service

The version of the OpenAPI document: 2
Contact: engineering@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'spec_helper'
require 'json'

# Unit tests for Patch::OrderLineItemsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'OrderLineItemsApi' do
  before do
    # run before each test
    @api_instance = Patch::OrderLineItemsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of OrderLineItemsApi' do
    it 'should create an instance of OrderLineItemsApi' do
      expect(@api_instance).to be_instance_of(Patch::OrderLineItemsApi)
    end
  end

  # unit tests for create_order_line_item
  # Creates an order line item
  # Creates a line item on an order that is in the &#x60;draft&#x60; state. 
  # @param order_id 
  # @param create_order_line_item_request 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :patch_version 
  # @return [OrderLineItemResponse]
  describe 'create_order_line_item test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_order_line_item
  # Deletes an order line item
  # Deletes a line item on an order that is in the &#x60;draft&#x60; state. 
  # @param order_id 
  # @param serial_number 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :patch_version 
  # @return [DeleteOrderLineItemResponse]
  describe 'delete_order_line_item test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_order_line_item
  # Updates an order line item
  # Updates a line item on an order that is in the &#x60;draft&#x60; state. 
  # @param order_id 
  # @param serial_number 
  # @param update_order_line_item_request 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :patch_version 
  # @return [OrderLineItemResponse]
  describe 'update_order_line_item test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
