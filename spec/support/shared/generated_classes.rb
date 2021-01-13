RSpec.shared_examples "a generated class" do
  describe '.openapi_nullable' do
    it 'returns a set with nullable properties' do
      expect(instance.class.openapi_nullable).to eq nullable_properties
    end
  end

  describe '#to_hash' do
    it 'returns a set with nullable properties' do
      expect(@instance.to_hash).to eq(instance_hash)
    end
  end
end
