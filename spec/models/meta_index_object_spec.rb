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

# Unit tests for Patch::MetaIndexObject
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'MetaIndexObject' do
  before do
    # run before each test
    @instance = build(:meta_index_object)
  end

  after do
    # run after each test
  end

  it_behaves_like "a generated class" do
    let(:instance) { @instance }
    let(:instance_hash) { { next_page: @instance.next_page, prev_page: @instance.prev_page } }
    let(:nullable_properties) { Set.new([:next_page, :prev_page]) }
  end

  describe 'test an instance of MetaIndexObject' do
    it 'should create an instance of MetaIndexObject' do
      expect(@instance).to be_instance_of(Patch::MetaIndexObject)
    end
  end
  describe 'test attribute "prev_page"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "next_page"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end
end
