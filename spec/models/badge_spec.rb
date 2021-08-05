describe Badge do
  subject { FactoryBot.build(:badge, recipient_name: 'Jhon', uuid: '7c853f5a-3501-420a-b181-04bb5baa6807') }

  describe '#generate_hash' do
    it 'generates 64 character long hash' do
      expect(subject.generate_hash).to eq 'e706657a4c405d8690b7270399ea94a9b82e88dd47bdf41ac5b539e1a8e1c226'
    end

    context 'when method called twice on same object' do
      it 'generates the same hash as at first time' do
        first_hash  = subject.generate_hash
        second_hash = subject.generate_hash

        expect(first_hash).to eq second_hash
      end
    end
  end
end
