RSpec.describe 'Orders Integration' do
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

    create_order_response = Patch::Order.create_order(mass_g: order_mass_g, project_id: project_id)

    order = create_order_response.data
    expect(create_order_response.success).to eq true
    expect(order.id).not_to be_nil
    expect(order.created_at).to be_a_kind_of(Time)
    expect(order.mass_g).to eq(order_mass_g)
    expect(order.price_cents_usd).to be_kind_of(Integer)
    expect(order.patch_fee_cents_usd).to be_kind_of(Integer)
    expect(order.registry_url).not_to be_empty
  end

  it 'supports create with issued_to' do
    retrieve_project_response = Patch::Project.retrieve_project(
      Constants::BIOMASS_TEST_PROJECT_ID
    )

    issued_to = { email: 'envimpact@companyb.com', name: 'Company B' }
    total_price_cents_usd = 50_00

    create_order_response = Patch::Order.create_order(
      total_price_cents_usd: total_price_cents_usd,
      issued_to: issued_to
    )

    expect(create_order_response.success).to eq true

    order = create_order_response.data

    expect(order.id).not_to be_nil
    expect(order.price_cents_usd + order.patch_fee_cents_usd).to eq total_price_cents_usd
    expect(order.issued_to.email).to eq(issued_to[:email])
    expect(order.issued_to.name).to eq(issued_to[:name])
  end

  it 'supports create with a total price' do
    retrieve_project_response = Patch::Project.retrieve_project(
      Constants::BIOMASS_TEST_PROJECT_ID
    )

    project_id = retrieve_project_response.data.id
    total_price_cents_usd = 50_00

    create_order_response = Patch::Order.create_order(
      total_price_cents_usd: total_price_cents_usd,
      project_id: project_id
    )

    expect(create_order_response.success).to eq true

    order = create_order_response.data

    expect(order.id).not_to be_nil
    expect(order.price_cents_usd + order.patch_fee_cents_usd).to eq total_price_cents_usd
    expect(order.registry_url).not_to be_empty
  end

  it 'supports creation with and querying by metadata' do
    metadata = { user: 'john doe' }

    create_order_response =
      Patch::Order.create_order(mass_g: 100, metadata: metadata)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.mass_g).to eq(100)
    expect(create_order_response.data.metadata).to eq(metadata)

    retrieve_orders_response = Patch::Order.retrieve_orders(
      page: 1, metadata: { user: 'john' }
    )
    expect(retrieve_orders_response.success).to eq true
    expect(retrieve_orders_response.data.count).to be >= 1
    expect(retrieve_orders_response.data.map(&:metadata))
      .to all(have_key(:user))
  end

  it 'supports creation in draft state' do
    create_order_response =
      Patch::Order.create_order(mass_g: 100, state: "draft")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.mass_g).to eq(100)
    expect(create_order_response.data.state).to eq("draft")
  end

  it 'supports place and cancel for orders created via an estimate' do
    create_estimate_to_place_response = Patch::Estimate.create_mass_estimate(mass_g: 100, create_order: true)
    order_to_place_id = create_estimate_to_place_response.data.order.id

    place_order_response = Patch::Order.place_order(order_to_place_id)
    expect(place_order_response.data.state).to eq 'placed'

    create_estimate_to_cancel_response = Patch::Estimate.create_mass_estimate(mass_g: 100, create_order: true)
    order_to_cancel_id = create_estimate_to_cancel_response.data.order.id

    cancel_order_response = Patch::Order.cancel_order(order_to_cancel_id)
    expect(cancel_order_response.data.state).to eq 'cancelled'
  end

  it 'supports place order with issued_to' do
    create_estimate_to_place_response = Patch::Estimate.create_mass_estimate(mass_g: 100, create_order: true)
    order_to_place_id = create_estimate_to_place_response.data.order.id

    issued_to = { email: 'envimpact@companya.com', name: 'Company A' }
    place_order_response = Patch::Order.place_order(order_to_place_id, issued_to: issued_to)
    expect(place_order_response.data.state).to eq 'placed'
    expect(place_order_response.data.issued_to.email).to eq(issued_to[:email])
    expect(place_order_response.data.issued_to.name).to eq(issued_to[:name])
  end

  it 'supports create with a vintage year' do
    create_order_response =
      Patch::Order.create_order(mass_g: 100, vintage_year: 2022)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.mass_g).to eq(100)
  end

  it 'supports create with an amount and unit' do
    create_order_response =
      Patch::Order.create_order(amount: 100, unit: "g")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.amount).to eq(100)
    expect(create_order_response.data.unit).to eq("g")
    expect(create_order_response.data.inventory[0]).to be_an_instance_of(
      Patch::OrderInventory
    )
    expect(create_order_response.data.inventory[0].project).to be_an_instance_of(
      Patch::OrderInventoryProject
    )
    expect(create_order_response.data.inventory[0].unit).to eq("g")
  end

  it 'supports create with a total price and currency' do
    create_order_response =
      Patch::Order.create_order(total_price: 100, currency: "EUR")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.price + create_order_response.data.patch_fee
    ).to be_within(1).of(100)
    expect(create_order_response.data.currency).to eq "EUR"
  end
end
