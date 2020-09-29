RSpec.describe 'Orders Integration' do
  before do
    Patch.configure do |config|
      config.access_token = ENV['SANDBOX_API_KEY']
    end
  end

  it 'supports create, place, cancel, retrieve and list' do
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

  it 'supports create with a project-id' do
    retrieve_projects_response = Patch::Project.retrieve_projects(page: 1)
    project_id = retrieve_projects_response.data.first.id

    create_order_response = Patch::Order.create_order(mass_g: 100_000, project_id: project_id)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.mass_g).to eq(100_000)
    expect(create_order_response.data.price_cents_usd).to eq("10.0")
    expect(create_order_response.data.patch_fee_cents_usd).to eq("1.0")
  end

  it 'supports create with metadata' do
    metadata = { user: 'john doe' }

    create_order_response = Patch::Order.create_order(mass_g: 100, metadata: metadata)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.mass_g).to eq(100)
    expect(create_order_response.data.metadata).to eq(metadata)
  end

  it 'supports place and cancel for orders created via an estimate' do
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
