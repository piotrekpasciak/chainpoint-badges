describe UuidValidator do
  describe '#validate_each' do
    subject { described_class.new(attributes: :uuid).validate_each(example_model, :uuid, value) }

    let(:example_model) { instance_double('example_model', errors: ActiveModel::Errors.new(OpenStruct.new)) }

    context 'when value is blank' do
      let(:value) { '' }

      it 'returns nil on validation' do
        expect(subject).to be_nil
      end
    end

    context 'when value is a valid UUID' do
      let(:value) { 'f1d51450-f3ac-11eb-8ef4-016ef7aeb175' }

      it 'returns nil on validation' do
        expect(subject).to be_nil
      end
    end

    context 'when value is a invalid UUID' do
      let(:value) { 'INVALID_UUID' }

      it 'returns error message on validation' do
        expect(subject.options[:message]).to eq 'must be a valid UUID'
      end
    end
  end
end
