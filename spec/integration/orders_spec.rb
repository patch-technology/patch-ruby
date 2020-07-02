require 'spec_helper'

RSpec.describe 'Orders Integration' do
  it "supports create, place, cancel, retrieve and list" do
    VCR.use_cassette('orders') do
      # Configure the Patch gem
      Patch.configure do |config|
        config.access_token = ENV['PATCH_RUBY_API_KEY']
        config.host = ENV['PATCH_RUBY_HOST']
      end

      create_order_response = Patch::Order.create_order(mass_g: 100)
      order_id = create_order_response.data.id

      retrieve_order_response = Patch::Order.retrieve_order(order_id)
      expect(retrieve_order_response.data.id).to eq order_id

      page_limit = 1
      next_page = 1
      orders = []

      while !next_page.nil? && next_page <= page_limit
        retrieve_orders_response = Patch::Order.retrieve_orders(page: next_page)
        next_page = retrieve_orders_response.meta.next_page
        orders += retrieve_orders_response.data
      end

      expect(orders.length).not_to be_zero
    end
  end

  it "supports place and cancel for order created via an estimate" do
    VCR.use_cassette('estimate_orders') do
      create_estimate_to_place_response = Patch::Estimate.create_mass_estimate(mass_g: 100)
      order_to_place_id = create_estimate_to_place_response.data.order.id

      place_order_response = Patch::Order.place_order(order_to_place_id)
      expect(place_order_response.data.state).to eq 'placed'

      create_estimate_to_cancel_response = Patch::Estimate.create_mass_estimate(mass_g: 100)
      order_to_cancel_id = create_estimate_to_cancel_response.data.order.id

      cancel_order_response = Patch::Order.cancel_order(order_to_cancel_id)
      expect(cancel_order_response.data.state).to eq 'cancelled'
    end
  end
end
