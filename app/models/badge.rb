class Badge < ApplicationRecord
  validates :recipent_name, presence: true
  validates :issue_date, presence: true
  validates :uuid, presence: true, uniqueness: true
  validates :proof_id, presence: true, uniqueness: true
  validates :hash, presence: true, uniqueness: true
end
