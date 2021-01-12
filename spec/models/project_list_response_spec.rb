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

# Unit tests for Patch::ProjectListResponse
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ProjectListResponse' do
  before do
    # run before each test
    @instance = Patch::ProjectListResponse.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProjectListResponse' do
    it 'should create an instance of ProjectListResponse' do
      expect(@instance).to be_instance_of(Patch::ProjectListResponse)
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

  describe 'test attribute "meta"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe '.openapi_nullable' do
    it 'returns a set with nullable properties' do
      expect(Patch::ProjectListResponse.openapi_nullable).to contain_exactly("error")
    end
  end
end
