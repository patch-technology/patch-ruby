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
      project_mass = project.inventory.sum(&:amount_available)
      expect(project_mass >= minimum_available_mass).to be true
    end
  end

  it 'returns the expected fields' do
    project = Patch::Project.retrieve_projects(page: 1).data.first

    keys = attributes_for(:project).keys
    expect(project.to_hash.keys).to include(*keys)

    expect(project.photos).to be_an_instance_of(Array)
    expect(project.longitude).to be_an_instance_of(Float)
    expect(project.latitude).to be_an_instance_of(Float)

    expect(project.technology_type)
      .to be_an_instance_of(Patch::TechnologyType)
    expect(project.technology_type.name).to be_an_instance_of(String)
    expect(project.technology_type.slug).to be_an_instance_of(String)

    parent_type = project.technology_type.parent_technology_type
    expect(parent_type).to be_an_instance_of(Patch::ParentTechnologyType)
    expect(parent_type.name).to be_an_instance_of(String)
    expect(parent_type.slug).to be_an_instance_of(String)

    expect(project.highlights).to be_an_instance_of(Array)

    inventory = project.inventory
    expect(inventory).to be_an_instance_of(Array)
    expect(inventory[0]).to be_an_instance_of(Patch::Inventory)
    expect(inventory[0].vintage_year).to be_an_instance_of(Integer)
    expect(inventory[0].vintage_start_year).to be_an_instance_of(Integer)
    expect(inventory[0].vintage_end_year).to be_an_instance_of(Integer)
    expect(inventory[0].amount_available).to be_an_instance_of(Integer)
    expect(inventory[0].price).to be_an_instance_of(Integer)
    expect(inventory[0].currency).to be_an_instance_of(String)
    expect(inventory[0].unit).to be_an_instance_of(String)

    issuance_type = project.issuance_type
    expect(issuance_type).to be_an_instance_of(String)

    disclaimers = project.disclaimers
    expect(disclaimers).to be_an_instance_of(Array)
    expect(disclaimers[0]).to be_an_instance_of(Patch::Disclaimer)
    expect(disclaimers[0].body).to be_an_instance_of(String)
    expect(disclaimers[0].header).to be_an_instance_of(String)
    expect(disclaimers[0].severity).to be_an_instance_of(String)
    expect(disclaimers[0].link_text).to be_an_instance_of(String)
    expect(disclaimers[0].link_destination).to be_an_instance_of(String)
  end

  it 'retrieves projects in the requested language' do
    projects_response = Patch::Project.retrieve_projects(accept_language: 'fr')

    expect(projects_response.data.last.name).to include 'Démo' # French

    project_id = projects_response.data.last.id
    project_response = Patch::Project.retrieve_project(project_id, accept_language: 'fr')
    expect(project_response.data.name).to include 'Démo' # French
  end
end
