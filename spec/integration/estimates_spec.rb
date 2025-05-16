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

  context "when creating an air shipping estimate" do
    it "supports creating an estimate using airports" do
      air_shipping_estimate = Patch::Estimate.create_air_shipping_estimate(
        aircraft_type: "cargo",
        create_order: false,
        destination_airport: "JFK",
        freight_mass_g: 31_300,
        origin_airport: "SFO"
      )
      expect(air_shipping_estimate.data.type).to eq('shipping_air')
      expect(air_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate with an order" do
      air_shipping_estimate = Patch::Estimate.create_air_shipping_estimate(
        aircraft_type: "cargo",
        create_order: true,
        destination_airport: "JFK",
        freight_mass_g: 19_140,
        origin_airport: "SFO"
      )
      expect(air_shipping_estimate.data.type).to eq('shipping_air')
      expect(air_shipping_estimate.data.mass_g).to be > 0
      expect(air_shipping_estimate.data.order.amount).to be > 0
    end
  end

  context "when creating a rail shipping estimate" do
    it "supports creating an estimate using locodes" do
      rail_shipping_estimate = Patch::Estimate.create_rail_shipping_estimate(
        create_order: false,
        destination_locode: "USSEA",
        emissions_scope: "wtw",
        freight_mass_g: 419_060,
        fuel_type: "diesel",
        origin_locode: "USSD2"
      )
      expect(rail_shipping_estimate.data.type).to eq('shipping_rail')
      expect(rail_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate using postal codes" do
      rail_shipping_estimate = Patch::Estimate.create_rail_shipping_estimate(
        create_order: false,
        destination_country_code: "US",
        destination_postal_code: "97209",
        emissions_scope: "wtw",
        freight_mass_g: 226_000,
        fuel_type: "diesel",
        origin_country_code: "US",
        origin_postal_code: "90210"
      )
      expect(rail_shipping_estimate.data.type).to eq('shipping_rail')
      expect(rail_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate with an order" do
      rail_shipping_estimate = Patch::Estimate.create_rail_shipping_estimate(
        create_order: true,
        destination_locode: "USSEA",
        freight_mass_g: 359_000,
        origin_locode: "USSD2"
      )
      expect(rail_shipping_estimate.data.type).to eq('shipping_rail')
      expect(rail_shipping_estimate.data.mass_g).to be > 0
      expect(rail_shipping_estimate.data.order.amount).to be > 0
    end
  end

  context "when creating a road shipping estimate" do
    it "supports creating an estimate using locodes" do
      road_shipping_estimate = Patch::Estimate.create_road_shipping_estimate(
        create_order: false,
        container_size_code: "20GP",
        destination_locode: "USSEA",
        emissions_scope: "wtw",
        freight_mass_g: 124_870,
        origin_locode: "USSD2"
      )
      expect(road_shipping_estimate.data.type).to eq('shipping_road')
      expect(road_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate using postal codes" do
      road_shipping_estimate = Patch::Estimate.create_road_shipping_estimate(
        create_order: false,
        destination_country_code: "US",
        destination_postal_code: "97209",
        emissions_scope: "wtw",
        freight_mass_g: 226_000,
        origin_country_code: "US",
        origin_postal_code: "90210"
      )
      expect(road_shipping_estimate.data.type).to eq('shipping_road')
      expect(road_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate with an order" do
      road_shipping_estimate = Patch::Estimate.create_road_shipping_estimate(
        create_order: true,
        destination_locode: "USSEA",
        freight_mass_g: 359_000,
        origin_locode: "USSD2"
      )
      expect(road_shipping_estimate.data.type).to eq('shipping_road')
      expect(road_shipping_estimate.data.mass_g).to be > 0
      expect(road_shipping_estimate.data.order.amount).to be > 0
    end
  end

  context "when creating a sea shipping estimate" do
    it "supports creating an estimate using locodes" do
      sea_shipping_estimate = Patch::Estimate.create_sea_shipping_estimate(
        create_order: false,
        container_size_code: "20GP",
        destination_locode: "HKHKG",
        emissions_scope: "wtw",
        freight_mass_g: 124_870,
        origin_locode: "FRMRS"
      )
      expect(sea_shipping_estimate.data.type).to eq('shipping_sea')
      expect(sea_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate using postal codes" do
      sea_shipping_estimate = Patch::Estimate.create_sea_shipping_estimate(
        create_order: false,
        destination_country_code: "US",
        destination_postal_code: "97209",
        emissions_scope: "wtw",
        freight_mass_g: 226_000,
        origin_country_code: "US",
        origin_postal_code: "90210"
      )
      expect(sea_shipping_estimate.data.type).to eq('shipping_sea')
      expect(sea_shipping_estimate.data.mass_g).to be > 0
    end

    it "supports creating an estimate with an order" do
      sea_shipping_estimate = Patch::Estimate.create_sea_shipping_estimate(
        create_order: true,
        destination_locode: "USSEA",
        freight_mass_g: 359_000,
        origin_locode: "USSD2"
      )
      expect(sea_shipping_estimate.data.type).to eq('shipping_sea')
      expect(sea_shipping_estimate.data.mass_g).to be > 0
      expect(sea_shipping_estimate.data.order.amount).to be > 0
    end
  end
end
