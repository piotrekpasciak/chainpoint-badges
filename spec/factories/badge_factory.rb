FactoryBot.define do
  factory :badge do
    recipent_name { 'Jhon' }
    issue_date    { 1.day.ago.to_date }
    uuid          { SecureRandom.uuid }
    proof_id      { SecureRandom.uuid }
    hash          { SecureRandom.hex(32) }
    metadata      { { hash_received: 1.day.ago } }
  end
end
