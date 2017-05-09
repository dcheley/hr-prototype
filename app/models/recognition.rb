class Recognition < ApplicationRecord
  acts_as_votable

  has_many :badges
  has_many :receivers, class_name: :User, foreign_key: :receiver_id, through: :badges
  has_many :recognizers, class_name: :User, foreign_key: :recognizer_id, through: :badges

  validates :name, presence: true
  validates :description, length: {maximum: 500}
end
