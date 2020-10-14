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
    retrieve_project_response = Patch::Project.retrieve_project(
      Constants::BIOMASS_TEST_PROJECT_ID
    )

    project_id = retrieve_project_response.data.id
    average_price_per_tonne_cents_usd = retrieve_project_response.data.average_price_per_tonne_cents_usd

    order_mass_g = 100_000
    tonne_per_gram = 1_000_000

    expected_price = (average_price_per_tonne_cents_usd.to_f / tonne_per_gram) * order_mass_g

    create_order_response = Patch::Order.create_order(mass_g: order_mass_g, project_id: project_id)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.mass_g).to eq(order_mass_g)
    expect(create_order_response.data.price_cents_usd.to_i).to eq(expected_price)
    expect(create_order_response.data.patch_fee_cents_usd).not_to be_empty
  end

  it 'supports create with a total price' do
    retrieve_project_response = Patch::Project.retrieve_project(
      Constants::BIOMASS_TEST_PROJECT_ID
    )

    project_id = retrieve_project_response.data.id
    total_price_cents_usd = 5_00

    create_order_response = Patch::Order.create_order(
      total_price_cents_usd: total_price_cents_usd,
      project_id: project_id
    )

    expect(create_order_response.success).to eq true

    order = create_order_response.data

    expect(order.id).not_to be_nil
    expect(order.mass_g).to eq(1_250_000)
    expect(order.price_cents_usd.to_i).to eq(125)
    expect(order.patch_fee_cents_usd.to_i).to eq(375)
    expect(
      order.price_cents_usd.to_i + order.patch_fee_cents_usd.to_i
    ).to eq(total_price_cents_usd)
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
