=begin
#Patch API V1

#The core API used to integrate with Patch's service

The version of the OpenAPI document: v1
Contact: developers@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'

# Unit tests for Patch::PreferencesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'PreferencesApi' do
  before do
    # run before each test
    @api_instance = Patch::PreferencesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PreferencesApi' do
    it 'should create an instance of PreferencesApi' do
      expect(@api_instance).to be_instance_of(Patch::PreferencesApi)
    end
  end

  # unit tests for create_preference
  # creates a project preference
  # Creates a project preference for the given organization. If you have a &#x60;preference&#x60; in place, all of your orders will be directed to the project the preference points to. 
  # @param [Hash] opts the optional parameters
  # @option opts [UNKNOWN_BASE_TYPE] :unknown_base_type 
  # @return [PreferenceResponse]
  describe 'create_preference test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_preference
  # Deletes an organization&#39;s preference for a project
  # Deletes the given &#x60;preference&#x60;. Once a preference is deleted, it cannot be undone. If you want to restore your previous preference, create a new one. 
  # @param id 
  # @param [Hash] opts the optional parameters
  # @return [PreferenceResponse]
  describe 'delete_preference test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for retrieve_preference
  # Retrieve the preference
  # Retrieve the preference and project of an organization. You can only retrieve preferences associated with your organization. 
  # @param id 
  # @param [Hash] opts the optional parameters
  # @return [PreferenceResponse]
  describe 'retrieve_preference test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for retrieve_preferences
  # Retrieves a list of preferences
  # Retrieves a list of preferences and associated projects of an organization. You can only retrieve preferences associated with your organization. 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page 
  # @return [PreferenceListResponse]
  describe 'retrieve_preferences test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
