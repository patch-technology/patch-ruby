# frozen_string_literal: true

RSpec.describe "Projects TechnologyTypes Integration" do
  it "returns a list of technology types and their parent types" do
    technology_types = Patch::TechnologyType.retrieve_technology_types()
    expect(technology_types.data.count).to be_positive
    expect(technology_types.data.first.slug).to be_a(String)
    expect(technology_types.data.first.name).to be_a(String)

    parent = technology_types.data.first.parent_technology_type
    expect(parent.slug).to be_a(String)
    expect(parent.name).to be_a(String)
  end
end
