class Booking < ApplicationRecord
  belongs_to :user

  enum :status, { pending: 0, accepted: 1, refused: 2, passed: 3 }

end
