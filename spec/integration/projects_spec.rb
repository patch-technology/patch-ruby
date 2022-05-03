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

      keys = attributes_for(:project).keys
      expect(project.to_hash.keys).to include(*keys)

      expect(project.photos).to be_an_instance_of(Array)
      expect(project.average_price_per_tonne_cents_usd)
        .to be_an_instance_of(Integer)
      expect(project.remaining_mass_g).to be_an_instance_of(Integer)
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

      inventory = project.inventory;
      expect(inventory).to be_an_instance_of(Array)
      expect(inventory[0]).to be_an_instance_of(Patch::Inventory)
      expect(inventory[0].vintage_year).to be_an_instance_of(Integer)
      expect(inventory[0].amount_available).to be_an_instance_of(Integer)
      expect(inventory[0].price).to be_an_instance_of(Integer)
      expect(inventory[0].currency).to be_an_instance_of(String)
      expect(inventory[0].unit).to be_an_instance_of(String)
    end
  end
end
