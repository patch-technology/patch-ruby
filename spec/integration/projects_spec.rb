require 'spec_helper'

RSpec.describe 'Projects Integration' do
  it "supports retrieve and list" do
    VCR.use_cassette('projects') do
      # START receive_projects
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
  end
end
