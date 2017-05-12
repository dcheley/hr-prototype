class Opportunity < ApplicationRecord
  acts_as_votable

  has_many :badges
  has_many :users, through: :badges

  has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, uniqueness: true
end
