RSpec.describe 'Estimates Integration' do
  before do
    Patch.configure do |config|
      config.access_token = ENV['SANDBOX_API_KEY']
    end
  end

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
    expect(flight_estimate.data.mass_g).to eq 1_031_697
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
      create_order: false
    )

    expect(vehicle_estimate.data.type).to eq 'vehicle'
    expect(vehicle_estimate.data.mass_g).to eq 5_500
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
    expect(create_estimate_response.data.mass_g).to eq 12_431
  end
end
