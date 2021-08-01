# This spec will make sure nobody broke any facotries when modyfing models. Breaking factories is very
# common scenario in projects developed by multiple developers.
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "#{factory_name.capitalize} factory" do
    it 'is valid' do
      build(factory_name).should be_valid
    end
  end
end
