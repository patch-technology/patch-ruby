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
require 'date'

# Unit tests for Patch::CreatePreferenceRequest
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'CreatePreferenceRequest' do
  before do
    # run before each test
    @instance = Patch::CreatePreferenceRequest.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CreatePreferenceRequest' do
    it 'should create an instance of CreatePreferenceRequest' do
      expect(@instance).to be_instance_of(Patch::CreatePreferenceRequest)
    end
  end
  describe 'test attribute "project_id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
