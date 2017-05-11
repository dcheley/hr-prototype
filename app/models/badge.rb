class Badge < ApplicationRecord
  acts_as_votable

  belongs_to :users, optional: true
  belongs_to :opportunities, optional: true
  belongs_to :receivers, class_name: :User, foreign_key: :receiver_id, optional: true
  belongs_to :recognizers, class_name: :User, foreign_key: :recognizer_id, optional: true

  validates :name, presence: true
  validates :description, length: {maximum: 500}
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
