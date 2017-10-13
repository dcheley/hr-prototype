class Badge < ApplicationRecord
  acts_as_votable

  belongs_to :users, optional: true
  belongs_to :opportunities, optional: true

  has_one :signup

  validates :name, presence: true
  validate :min_one
  # validate :at_least_one_colour

  accepts_nested_attributes_for :signup

  # def at_least_one_colour
  #   if [self.red, self.blue, self.purple, self.green, self.yellow, self.grey, self.pink].reject(&:blank?).size == 0
  #     errors[:base] << ("Badge colour required.")
  #   end
  # end

  def min_one
    if [self.exp, self.education].reject(&:blank?).size == 0
      errors[:base] << ("Badge type required.")
    end
  end
end
