class Opportunity < ApplicationRecord
  has_many :badges
  has_many :users, through: :badges

  validates :name, uniqueness: true
end
