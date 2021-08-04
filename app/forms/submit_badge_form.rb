class SubmitBadgeForm
  include ActiveModel::Model

  attr_accessor :issue_date, :recipient_name, :uuid

  validates :issue_date, :recipient_name, :uuid, presence: true
  validates :uuid, uuid: true
  validate :uuid_uniqueness

  def save
    return false if invalid?

    new_badge      = build_badge
    request_result = create_hash_in_chainpoint(new_badge.chainpoint_hash)

    return handle_chainpoint_api_failure(request_result.value) if request_result.failure?

    create_badge!(new_badge, request_result.value)
  end

  # Fix for issue_date field to be compatible with form date_field - it has to be Date type
  def issue_date # rubocop:disable Lint/DuplicateMethods
    @issue_date.to_s.to_date
  end

  private

  def uuid_uniqueness
    errors.add(:uuid, 'is already taken') if Badge.exists?(uuid: uuid)
  end

  def build_badge
    Badge.new(issue_date: issue_date, recipient_name: recipient_name, uuid: uuid).tap do |badge|
      badge.chainpoint_hash = badge.generate_hash
    end
  end

  def create_hash_in_chainpoint(chainpoint_hash)
    Chainpoint::CreateHashService.new(hash: chainpoint_hash).call
  end

  def handle_chainpoint_api_failure(error_message)
    errors.add(:base, error_message)

    false
  end

  def create_badge!(new_badge, chainpoint_data)
    new_badge.metadata = chainpoint_data['meta']
    new_badge.proof_id = chainpoint_data['hashes'][0]['proof_id']

    new_badge.save!

    new_badge
  end
end
