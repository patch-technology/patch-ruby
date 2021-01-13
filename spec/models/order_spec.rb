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

# Unit tests for Patch::Order
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'Order' do
  before do
    # run before each test
    @instance = build(:order)
  end

  after do
    # run after each test
  end

  it_behaves_like "a generated class" do
    let(:instance) { @instance }
    let(:instance_hash) {
      {
        id: @instance.id,
        mass_g: @instance.mass_g,
        production: @instance.production,
        state: @instance.state,
        allocation_state: @instance.allocation_state,
        price_cents_usd: @instance.price_cents_usd,
        patch_fee_cents_usd: @instance.patch_fee_cents_usd,
        metadata: @instance.metadata
      }
    }
    let(:nullable_properties) { Set.new(["patch_fee_cents_usd", "price_cents_usd"]) }
  end

  describe 'test an instance of Order' do
    it 'should create an instance of Order' do
      expect(@instance).to be_instance_of(Patch::Order)
    end
  end
  describe 'test attribute "id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "mass_g"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "production"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "state"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["draft", "placed", "complete", "cancelled"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.state = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "allocation_state"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["pending", "partially_allocated", "allocated"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.allocation_state = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "price_cents_usd"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "allocations"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end
end
