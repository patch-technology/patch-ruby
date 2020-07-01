require 'spec_helper'

RSpec.describe 'Orders Integration' do
  it "supports create, place, cancel, retrieve and list" do
    create_order_response = Patch::Order.create_order(body: { mass_g: 100 })
    order_id = create_order_response.data.id

    retrieve_order_response = Patch::Order.retrieve_order(order_id)
    expect(retrieve_order_response.data.id).to eq order_id

    # place_order_response = Patch::Order.place_order(order_id)
    # expect(place_order_response.data.state).to eq 'placed'

    # place_order_response = Patch::Order.cancel_order(order_id)
    # expect(place_order_response.data.state).to eq 'cancelled'

    # TODO add pagination
    retrieve_orders_response = Patch::Order.retrieve_orders
    expect(retrieve_orders_response.data).to be_a(Array)
  end
end
