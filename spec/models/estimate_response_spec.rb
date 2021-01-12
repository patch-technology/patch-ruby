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

# Unit tests for Patch::EstimateResponse
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'EstimateResponse' do
  before do
    # run before each test
    @instance = Patch::EstimateResponse.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of EstimateResponse' do
    it 'should create an instance of EstimateResponse' do
      expect(@instance).to be_instance_of(Patch::EstimateResponse)
    end
  end
  describe 'test attribute "success"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "error"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "data"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe '.openapi_nullable' do
    it 'returns a set with nullable properties' do
      expect(Patch::EstimateResponse.openapi_nullable).to contain_exactly("error")
    end
  end
end
