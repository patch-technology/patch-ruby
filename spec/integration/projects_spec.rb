RSpec.describe 'Projects Integration' do
  Patch.configure do |config|
    config.access_token = ENV['SANDBOX_API_KEY']
  end

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

  describe 'returned fields' do
    before do
      @project = Patch::Project.retrieve_projects(page: 1).data.first
    end

    it 'returns photos' do
      expect(@project.photos).to be_an_instance_of(Array)
    end

    it 'returns average_price_per_tonne_cents_usd' do
      expect(@project.average_price_per_tonne_cents_usd).to be_an_instance_of(Integer)
    end

    it 'returns remaining_mass_g' do
      expect(@project.remaining_mass_g).to be_an_instance_of(Integer)
    end
  end
end
