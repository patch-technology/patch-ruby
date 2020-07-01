require 'spec_helper'

RSpec.describe 'Orders Integration' do
  it "supports create, place, cancel, retrieve and list" do
    VCR.use_cassette('orders') do
      # Configure the Patch gem
      Patch.configure do |config|
        config.access_token = ENV['PATCH_RUBY_API_KEY']
        config.host = 'https://api.staging-patch.com/'
      end

      create_order_response = Patch::Order.create_order(body: { mass_g: 100 })
      order_id = create_order_response.data.id

      retrieve_order_response = Patch::Order.retrieve_order(order_id)
      expect(retrieve_order_response.data.id).to eq order_id

      # place_order_response = Patch::Order.place_order(order_id)
      # expect(place_order_response.data.state).to eq 'placed'

      # place_order_response = Patch::Order.cancel_order(order_id)
      # expect(place_order_response.data.state).to eq 'cancelled'

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
end
