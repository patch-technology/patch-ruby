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

# Unit tests for Patch::CreateMassEstimateRequest
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'CreateMassEstimateRequest' do
  before do
    # run before each test
    @instance = build(:create_mass_estimate_request)
  end

  after do
    # run after each test
  end

  it_behaves_like "a generated class" do
    let(:instance) { @instance }
    let(:instance_hash) { { project_id: @instance.project_id, mass_g: @instance.mass_g } }
    let(:nullable_properties) { Set.new(["create_order"]) }
  end

  describe 'test an instance of CreateMassEstimateRequest' do
    it 'should create an instance of CreateMassEstimateRequest' do
      expect(@instance).to be_instance_of(Patch::CreateMassEstimateRequest)
    end
  end
  describe 'test attribute "mass_g"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end
end
