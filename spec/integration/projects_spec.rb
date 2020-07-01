require 'spec_helper'

RSpec.describe 'Projects Integration' do
  it "supports retrieve and list" do
    # TODO add pagination
    retrieve_projects_response = Patch::Project.retrieve_projects
    expect(retrieve_projects_response.data.length).not_to be_zero
    project_id = retrieve_projects_response.data.first.id

    retrieve_project_response = Patch::Project.retrieve_project(project_id)
    expect(retrieve_project_response.data.id).to eq project_id
  end
end
