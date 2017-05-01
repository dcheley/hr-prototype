class Badge < ApplicationRecord
  acts_as_votable

  belongs_to :users, optional: true
  belongs_to :opportunities, optional: true

  validates :name, presence: true
  validates :description, length: {maximum: 500}
  validate :at_least_one_colour

  def at_least_one_colour
    if [self.red, self.blue, self.purple, self.green, self.yellow, self.grey, self.pink].reject(&:blank?).size == 0
      errors[:base] << ("Badge colour required.")
    end
  end
end
