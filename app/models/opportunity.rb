class Opportunity < ApplicationRecord
  has_many :badges
  has_many :users, through: :badges

  has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"

  validates :name, uniqueness: true
end
