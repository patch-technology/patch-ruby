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

  it 'supports create with a project-id' do
    retrieve_projects_response = Patch::Project.retrieve_projects(page: 1)
    project_id = retrieve_projects_response.data.first.id
    create_estimate_response = Patch::Estimate.create_mass_estimate(mass_g: 100, project_id: project_id)
    estimate_id = create_estimate_response.data.id

    expect(create_estimate_response.success).to eq true
    expect(create_estimate_response.data.order.id).not_to be_nil
    expect(create_estimate_response.data.order.mass_g).to eq(100)
  end
end
