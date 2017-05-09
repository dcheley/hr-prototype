class Recognition < ApplicationRecord
  acts_as_votable

  has_many :badges
  has_many :receivers, class_name: :User, through: :badges
  has_many :recognizers, class_name: :User, through: :badges
  # belongs_to :receiver, class_name: :User
  # belongs_to :recognizer, class_name: :User

  validates :name, presence: true
  validates :description, length: {maximum: 500}
end
