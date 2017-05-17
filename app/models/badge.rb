class Badge < ApplicationRecord
  acts_as_votable

  belongs_to :users, optional: true
  belongs_to :opportunities, optional: true

  validates :name, presence: true
  validate :min_one
  # validate :at_least_one_colour

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
