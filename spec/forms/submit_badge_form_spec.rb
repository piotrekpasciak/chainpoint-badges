describe SubmitBadgeForm do
  subject { described_class.new(attributes) }

  describe '#save' do
    context 'when form attributes are valid' do
      let(:attributes) do
        {
          issue_date:    Date.new(2021, 5, 1),
          recipent_name: 'Jhon',
          uuid:          SecureRandom.uuid
        }
      end

      it 'returns true' do
        expect(subject.save).to eq true
      end
    end

    context 'when form attributes are invalid' do
      let(:attributes) do
        {
          issue_date:    Date.new(2021, 5, 1),
          recipent_name: nil,
          uuid:          SecureRandom.uuid
        }
      end

      it 'returns false' do
        expect(subject.save).to eq false
      end
    end
  end
end
