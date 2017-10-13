class Badge < ApplicationRecord
  acts_as_votable

  belongs_to :users, optional: true
  belongs_to :opportunities, optional: true

  has_one :signup

  validates :name, presence: true
  validate :min_one

  accepts_nested_attributes_for :signup

  def min_one
    if [self.exp, self.education].reject(&:blank?).size == 0
      errors[:base] << ("Badge type required.")
    end
  end
end
