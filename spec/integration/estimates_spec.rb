require 'spec_helper'

RSpec.describe 'Estimates Integration' do
  it "supports create, retrieve and list" do
    VCR.use_cassette('estimates') do
      # Configure the Patch gem
      Patch.configure do |config|
        config.access_token = ENV['PATCH_RUBY_API_KEY']
        config.host = ENV['PATCH_RUBY_HOST']
      end

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
  end
end
