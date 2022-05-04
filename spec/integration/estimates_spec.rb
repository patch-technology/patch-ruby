RSpec.describe 'Estimates Integration' do
  it 'supports create, retrieve and list' do
    create_estimate_response = Patch::Estimate.create_mass_estimate(mass_g: 100)
    estimate_id = create_estimate_response.data.id

    retrieve_estimate_response = Patch::Estimate.retrieve_estimate(estimate_id)
    expect(retrieve_estimate_response.data.id).to eq estimate_id

    page_limit = 1
    next_page = 1
    estimates = []

    while !next_page.nil? && next_page <= page_limit
      retrieve_estimates_response = Patch::Estimate.retrieve_estimates(page: next_page)
      next_page = retrieve_estimates_response.meta.next_page
      estimates += retrieve_estimates_response.data
    end

    expect(estimates.length).not_to be_zero
  end

  it 'supports creating flight estimates' do
    distance_m = 10_000_000
    flight_estimate = Patch::Estimate.create_flight_estimate(
      distance_m: distance_m,
      create_order: false
    )

    expect(flight_estimate.data.type).to eq 'flight'
    expect(flight_estimate.data.mass_g).to be >= 1_000_000
  end

  it 'supports creating flight estimates with origin and destination' do
    flight_estimate = Patch::Estimate.create_flight_estimate(
      origin_airport: "SFO",
      destination_airport: "LAX"
    )

    flight_estimate_longer = Patch::Estimate.create_flight_estimate(
      origin_airport: "SFO",
      destination_airport: "JFK"
    )

    expect(flight_estimate.data.type).to eq 'flight'
    expect(flight_estimate_longer.data.mass_g).to be > 2 * flight_estimate.data.mass_g
  end

  it 'supports creating vehicle estimates' do
    distance_m = 10_000
    make = "Toyota"
    model = "Corolla"
    year = 2000

    vehicle_estimate = Patch::Estimate.create_vehicle_estimate(
      distance_m: distance_m,
      make: make,
      model: model,
      year: year,
      create_order: true
    )

    expect(vehicle_estimate.data.type).to eq 'vehicle'
    expect(vehicle_estimate.data.mass_g).to be >= 1_000
    expect(vehicle_estimate.data.order.amount).to be >= 1_000
  end

  it 'supports creating vehicle estimates with partial information' do
    distance_m = 10_000

    vehicle_estimate = Patch::Estimate.create_vehicle_estimate(
      distance_m: distance_m,
      create_order: false
    )

    expect(vehicle_estimate.data.type).to eq 'vehicle'
    expect(vehicle_estimate.data.mass_g).to eq 2_132
  end

  it 'supports creating shipping estimates' do
    distance_m = 100_000_000
    package_mass_g = 10_000
    create_estimate_response = Patch::Estimate.create_shipping_estimate(
      distance_m: distance_m,
      package_mass_g: package_mass_g,
      transportation_method: 'rail',
      create_order: false
    )

    expect(create_estimate_response.data.type).to eq 'shipping'
    expect(create_estimate_response.data.mass_g).to be >= 10_000
  end


  it 'supports creating bitcoin estimates with partial information' do
    bitcoin_estimate = Patch::Estimate.create_bitcoin_estimate()

    expect(bitcoin_estimate.data.type).to eq 'bitcoin'
    expect(bitcoin_estimate.data.mass_g).to be >= 2_000
  end

  it 'supports creating bitcoin estimates with a transaction amount' do
    bitcoin_estimate = Patch::Estimate.create_bitcoin_estimate(
      transaction_value_btc_sats: 10_000
    )

    bitcoin_estimate_2 = Patch::Estimate.create_bitcoin_estimate(
      transaction_value_btc_sats: 100_000
    )

    expect(bitcoin_estimate.data.type).to eq 'bitcoin'
    expect(bitcoin_estimate.data.mass_g).to be < bitcoin_estimate_2.data.mass_g
  end

  it 'supports creating bitcoin estimates with a timestamp' do
    bitcoin_estimate_1 = Patch::Estimate.create_bitcoin_estimate(
      timestamp: '2021-06-01T20:31:18.403Z'
    )

    bitcoin_estimate_2 = Patch::Estimate.create_bitcoin_estimate(
      timestamp: '2021-07-01T20:31:18.403Z'
    )

    expect(bitcoin_estimate_1.data.type).to eq 'bitcoin'
    expect(bitcoin_estimate_1.data.mass_g).to be > bitcoin_estimate_2.data.mass_g # Bitcoin was emitting less in July 2021 than in June
  end

  it 'supports creating bitcoin estimates with a average_daily_balance_btc_sats' do
    bitcoin_estimate_1 = Patch::Estimate.create_bitcoin_estimate(
      average_daily_balance_btc_sats: 1000000
    )

    bitcoin_estimate_2 = Patch::Estimate.create_bitcoin_estimate(
      average_daily_balance_btc_sats: 10000000
    )

    expect(bitcoin_estimate_1.data.type).to eq 'bitcoin'
    expect(bitcoin_estimate_1.data.mass_g).to be < bitcoin_estimate_2.data.mass_g
  end

  it 'supports creating ethereum estimates with a gas amount' do
    ethereum_estimate = Patch::Estimate.create_ethereum_estimate(
      gas_used: 100
    )

    ethereum_estimate_2 = Patch::Estimate.create_ethereum_estimate(
      gas_used: 1000
    )

    expect(ethereum_estimate.data.type).to eq 'ethereum'
    expect(ethereum_estimate.data.mass_g).to be < ethereum_estimate_2.data.mass_g
  end

  it 'supports creating ethereum estimates with partial information' do
    ethereum_estimate = Patch::Estimate.create_ethereum_estimate({ create_order: false })

    expect(ethereum_estimate.data.type).to eq 'ethereum'
    expect(ethereum_estimate.data.mass_g).to be >= 2_000
  end

  it 'supports creating hotel estimates' do
    create_estimate_response = Patch::Estimate.create_hotel_estimate(
      country_code: "US",
      city: "Denver",
      star_rating: 5,
      number_of_nights: 2,
      number_of_rooms: 2
    )

    expect(create_estimate_response.success).to eq(true)
    expect(create_estimate_response.data.type).to eq 'hotel'
    expect(create_estimate_response.data.mass_g).to be >= 100_000
    expect(create_estimate_response.data.id).not_to be_nil
  end
end
