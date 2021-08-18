RSpec.describe 'Projects Integration' do
  it 'supports retrieve and list' do
    page_limit = 1
    next_page = 1
    projects = []

    while !next_page.nil? && next_page <= page_limit
      retrieve_projects_response = Patch::Project.retrieve_projects(page: next_page)
      next_page = retrieve_projects_response.meta.next_page
      projects += retrieve_projects_response.data
    end

    expect(projects.length).not_to be_zero
    project_id = retrieve_projects_response.data.first.id
    # END receive_projects

    retrieve_project_response = Patch::Project.retrieve_project(project_id)
    expect(retrieve_project_response.data.id).to eq project_id
  end

  it 'supports filtering projects' do
    country = 'US'
    projects = Patch::Project.retrieve_projects(country: country)
    projects.data.map do |project|
      expect(project.country).to eq country
    end

    type = 'dac'
    projects = Patch::Project.retrieve_projects(type: type)
    projects.data.map do |project|
      expect(project.type).to eq type
    end

    minimum_available_mass = 100
    projects = Patch::Project.retrieve_projects(minimum_available_mass: minimum_available_mass)
    projects.data.map do |project|
      expect(project.remaining_mass_g >= minimum_available_mass).to be true
    end
  end

  describe 'returned fields' do
    it 'returns the expected fields' do
      project = Patch::Project.retrieve_projects(page: 1).data.first

      expect(project.photos).to be_an_instance_of(Array)
      expect(project.average_price_per_tonne_cents_usd).to be_an_instance_of(Integer)
      expect(project.remaining_mass_g).to be_an_instance_of(Integer)
    end
  end
end
