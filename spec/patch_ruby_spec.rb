describe Patch do
  context 'Models' do
    it 'defines all models' do
      constants.each do |constant|
        expect { Patch.const_get(constant) }.not_to raise_error
      end
    end
  end

  def constants
    # Given a file path return the constant of that path, for example:
    # 'lib/patch_ruby/models/project_response.rb' -> ProjectResponse
    Dir.glob("lib/patch_ruby/models/*.rb").map do |file|
      parsed_filename = file.split('/').last.split('.').first
      constant = parsed_filename.split('_').map(&:capitalize).join('')
    end
  end
end
