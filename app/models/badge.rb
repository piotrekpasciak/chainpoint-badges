class Badge < ApplicationRecord
  validates :recipient_name, presence: true
  validates :issue_date, presence: true
  validates :uuid, presence: true, uniqueness: true, uuid: true
  validates :proof_id, presence: true, uniqueness: true, uuid: true
  validates :hash, presence: true, uniqueness: true
end
