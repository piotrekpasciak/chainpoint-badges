describe SubmitBadgeForm do
  subject { described_class.new(attributes) }

  describe '#save' do
    context 'when form attributes are valid' do
      let(:attributes) do
        {
          issue_date:     Date.new(2021, 5, 1),
          recipient_name: 'Jhon',
          uuid:           SecureRandom.uuid
        }
      end

      context 'when Chainpoint API returns success' do
        it 'returns true' do
          result = VCR.use_cassette('chainpoint_api/hashes/create/success') do
            subject.save
          end

          expect(result).to be_truthy
        end
      end

      context 'when Chainpoint API returns failure' do
        it 'returns true' do
          result = VCR.use_cassette('chainpoint_api/hashes/create/failure') do
            subject.save
          end

          expect(result).to eq false
        end
      end
    end

    context 'when form attributes are invalid' do
      let(:attributes) do
        {
          issue_date:     Date.new(2021, 5, 1),
          recipient_name: nil,
          uuid:           SecureRandom.uuid
        }
      end

      it 'returns false' do
        expect(subject.save).to eq false
      end
    end
  end
end
