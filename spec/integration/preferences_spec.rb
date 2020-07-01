require 'spec_helper'

RSpec.describe 'Preferences Integration' do
  it "supports create, delete, retrieve and list" do
    retrieve_projects_response = Patch::Project.retrieve_projects
    expect(retrieve_projects_response.data.length).not_to be_zero
    project_id = retrieve_projects_response.data.first.id

    create_preference_response = Patch::Preference.create_preference(body: { project_id: project_id })
    preference_id = create_preference_response.data.id

    retrieve_preference_response = Patch::Preference.retrieve_preference(preference_id)
    expect(retrieve_preference_response.data.id).to eq preference_id

    delete_preference_response = Patch::Preference.delete_preference(preference_id)

    # TODO add pagination
    retrieve_preferences_response = Patch::Preference.retrieve_preferences
    expect(retrieve_preferences_response.data).to be_a(Array)
  end
end
