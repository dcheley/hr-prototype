class Signup < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  ratyrate_rateable "satisfaction"
end
