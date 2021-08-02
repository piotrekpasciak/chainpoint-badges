class SubmitBadgeForm
  include ActiveModel::Model

  attr_accessor :issue_date, :recipient_name, :uuid

  validates :issue_date, :recipient_name, :uuid, presence: true
  validates :uuid, uuid: true

  def save
    return false if invalid?

    true
  end

  # Fix for issue_date field to be compatible with form date_field - it has to be Date type
  def issue_date # rubocop:disable Lint/DuplicateMethods
    @issue_date.to_s.to_date
  end
end
