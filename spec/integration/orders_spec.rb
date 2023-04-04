RSpec.describe 'Orders Integration' do
  it 'supports create, place, cancel, retrieve and list' do
    create_order_response = Patch::Order.create_order(amount: 100, unit: "g")
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

    order_amount = 100_000
    tonne_per_gram = 1_000_000

    create_order_response = Patch::Order
      .create_order(amount: order_amount, unit: "g", project_id: project_id)

    order = create_order_response.data
    expect(create_order_response.success).to eq true
    expect(order.id).not_to be_nil
    expect(order.created_at).to be_a_kind_of(Time)
    expect(order.amount).to eq(order_amount)
    expect(order.unit).to eq("g")
    expect(order.price).to be_kind_of(Integer)
    expect(order.patch_fee).to be_kind_of(Integer)
    expect(order.registry_url).not_to be_empty
  end

  it 'supports create with issued_to' do
    retrieve_project_response = Patch::Project.retrieve_project(
      Constants::BIOMASS_TEST_PROJECT_ID
    )

    issued_to = { email: 'envimpact@companyb.com', name: 'Company B' }
    total_price = 50_00

    create_order_response = Patch::Order.create_order(
      total_price: total_price,
      currency: "USD",
      issued_to: issued_to
    )

    expect(create_order_response.success).to eq true

    order = create_order_response.data

    expect(order.id).not_to be_nil
    expect(order.price + order.patch_fee).to eq total_price
    expect(order.issued_to.email).to eq(issued_to[:email])
    expect(order.issued_to.name).to eq(issued_to[:name])
  end

  it 'supports creation with and querying by metadata' do
    metadata = { user: 'john doe' }

    create_order_response =
      Patch::Order.create_order(amount: 100, unit: "g", metadata: metadata)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.amount).to eq(100)
    expect(create_order_response.data.unit).to eq("g")
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
      Patch::Order.create_order(amount: 100, unit: "g", state: "draft")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.amount).to eq(100)
    expect(create_order_response.data.unit).to eq("g")
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
      Patch::Order.create_order(amount: 100, unit: "g", vintage_year: 2022)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.amount).to eq(100)
    expect(create_order_response.data.unit).to eq("g")
  end

  it 'supports create with a vintage start year and vintage end year' do
    create_order_response =
      Patch::Order.create_order(amount: 100, unit: "g", vintage_start_year: 2022, vintage_end_year: 2023)

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.amount).to eq(100)
    expect(create_order_response.data.unit).to eq("g")
  end

  it 'supports create with an amount and unit' do
    create_order_response =
      Patch::Order.create_order(amount: 100, unit: "g")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.amount).to eq(100)
    expect(create_order_response.data.unit).to eq("g")
    expect(create_order_response.data.line_items[0]).to be_an_instance_of(
      Patch::OrderLineItem
    )
    expect(create_order_response.data.line_items[0].project).to be_an_instance_of(
      Patch::OrderLineItemProject
    )
    expect(create_order_response.data.line_items[0].unit).to eq("g")
  end

  it 'supports create with a total price and foreign currency' do
    create_order_response =
      Patch::Order.create_order(total_price: 100, currency: "EUR")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.price + create_order_response.data.patch_fee
    ).to be_within(1).of(100)
    expect(create_order_response.data.currency).to eq "EUR"
  end

  it 'supports creating an empty draft order and adding/editing line items' do
    # Create empty order
    create_order_response =
      Patch::Order.create_order(state: "draft")

    expect(create_order_response.success).to eq true
    expect(create_order_response.data.id).not_to be_nil
    expect(create_order_response.data.price).to eq(0)
    expect(create_order_response.data.amount).to eq(0)
    expect(create_order_response.data.line_items).to eq([])

    # Add project to order
    order_id = create_order_response.data.id
    retrieve_project_response = Patch::Project.retrieve_project(
      Constants::BIOMASS_TEST_PROJECT_ID
    )
    project_id = retrieve_project_response.data.id

    create_line_item_response = Patch::OrderLineItem
      .create_order_line_item(order_id, { project_id: project_id })

    expect(create_line_item_response.success).to eq(true)
    expect(create_line_item_response.data.id).not_to be_nil
    expect(create_line_item_response.data.amount).to eq(0)

    # Update amount on line item
    line_item_id = create_line_item_response.data.id
    update_order_line_item_response = Patch::OrderLineItem
      .update_order_line_item(order_id, line_item_id, { amount: 100000, unit: "g" })

    expect(update_order_line_item_response.success).to eq(true)
    expect(update_order_line_item_response.data.id).not_to be_nil
    expect(update_order_line_item_response.data.amount).to eq(100000)
    expect(update_order_line_item_response.data.price).to be >= 0

    # Fetch order and check line item matches
    retrieve_order_response = Patch::Order.retrieve_order(order_id)
    expect(retrieve_order_response.data.id).to eq order_id
    expect(retrieve_order_response.data.line_items.length).to eq(1)
    expect(retrieve_order_response.data.line_items[0].id).to eq(line_item_id)
    expect(retrieve_order_response.data.line_items[0].amount).to eq(100000)

    # Delete line item
    delete_line_item_response = Patch::OrderLineItem.delete_order_line_item(order_id, line_item_id)
    expect(delete_line_item_response.success).to eq(true)
    expect(delete_line_item_response.data).to eq(line_item_id)

    # Add line item via vintage_start_year and vintage_end_year
    create_order_line_item_response = Patch::OrderLineItem
      .create_order_line_item(order_id, { project_id: project_id, amount: 300000, unit: "g", vintage_start_year: 2023, vintage_end_year: 2025 })

    expect(create_order_line_item_response.success).to eq(true)
    expect(create_order_line_item_response.data.id).not_to be_nil
    expect(create_order_line_item_response.data.amount).to eq(300000)
    expect(create_order_line_item_response.data.vintage_start_year).to eq(2023)
    expect(create_order_line_item_response.data.vintage_end_year).to eq(2025)
    expect(create_order_line_item_response.data.price).to be >= 0

    # Fetch order and check line item matches
    retrieve_order_response = Patch::Order.retrieve_order(order_id)
    expect(retrieve_order_response.data.id).to eq order_id
    expect(retrieve_order_response.data.line_items.length).to eq(1)
    expect(retrieve_order_response.data.line_items[0].id).to eq(line_item_id)
    expect(retrieve_order_response.data.line_items[0].amount).to eq(300000)
    expect(retrieve_order_response.data.line_items[0].vintage_start_year).to eq(2023)
    expect(retrieve_order_response.data.line_items[0].vintage_end_year).to eq(2025)

    # Delete line item
    line_item_id = create_order_line_item_response.data.id
    delete_line_item_response = Patch::OrderLineItem.delete_order_line_item(order_id, line_item_id)
    expect(delete_line_item_response.success).to eq(true)
    expect(delete_line_item_response.data).to eq(line_item_id)

    # Fetch order and see it has no line items
    retrieve_order_response = Patch::Order.retrieve_order(order_id)
    expect(retrieve_order_response.data.id).to eq order_id
    expect(retrieve_order_response.data.line_items.length).to eq(0)

    # Delete order
    delete_order_response = Patch::Order.delete_order(order_id)
    expect(delete_order_response.success).to eq(true)
    expect(delete_order_response.data).to eq(order_id)
  end
end
