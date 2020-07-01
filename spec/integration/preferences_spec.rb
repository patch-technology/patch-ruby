require 'spec_helper'

RSpec.describe 'Preferences Integration' do
  it "supports create, delete, retrieve and list" do
    VCR.use_cassette('preferences') do
      retrieve_projects_response = Patch::Project.retrieve_projects
      expect(retrieve_projects_response.data.length).not_to be_zero
      project_id = retrieve_projects_response.data.first.id

      create_preference_response = Patch::Preference.create_preference(body: { project_id: project_id })
      preference_id = create_preference_response.data.id

      retrieve_preference_response = Patch::Preference.retrieve_preference(preference_id)
      expect(retrieve_preference_response.data.id).to eq preference_id

      # START receive_preferences
      page_limit = 1
      next_page = 1
      preferences = []

      while !next_page.nil? && next_page <= page_limit
        retrieve_preferences_response = Patch::Preference.retrieve_preferences(page: next_page)
        next_page = retrieve_preferences_response.meta.next_page
        preferences += retrieve_preferences_response.data
      end

      expect(preferences.length).not_to be_zero
      # END receive_preferences

      delete_preference_response = Patch::Preference.delete_preference(preference_id)
      expect(delete_preference_response.data.id).to eq preference_id
    end
  end
end
