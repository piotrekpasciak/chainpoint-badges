describe Chainpoint::CreateHashService do
  subject { described_class.new(hash: hash) }

  let(:hash) { '56802f4cd581c49f28d3297226a052fb5f3ed10ea57d893f353a7ebd84914443' }

  describe '#call' do
    context 'when invalid params provided' do
      let(:hash) { 'INVALID_HASH' }

      it 'returns failure with error message' do
        result = VCR.use_cassette('chainpoint_api/hashes/create/failure') do
          subject.call
        end

        expect(result).to be_failure
        expect(result.value).to eq 'invalid JSON body, invalid hashes present'
      end
    end

    context 'when valid params provided' do
      it 'return success with hash data' do
        result = VCR.use_cassette('chainpoint_api/hashes/create/success') do
          subject.call
        end

        expect(result).to be_success
        expect(result.value['hashes'][0]['proof_id']).to eq '659f1560-f552-11eb-8ef4-01c583537397'
      end
    end

    context 'when Chainpoint API timed out' do
      before { stub_request(:post, "#{Rails.application.credentials.chainpoint[:api_url]}hashes").to_timeout }

      it 'returns failure with error message' do
        result = subject.call

        expect(result).to be_failure
        expect(result.value).to eq 'execution expired'
      end
    end
  end
end
