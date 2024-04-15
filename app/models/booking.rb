class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  # enum :status, { pending: 0, accepted: 1, refused: 2, passed: 3 }
  validates :end_date, comparison: { greater_than: :start_date }
end
