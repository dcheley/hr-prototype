class Opportunity < ApplicationRecord
  acts_as_votable

  has_many :badges
  has_many :users, through: :badges

  has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, uniqueness: true
  validates :name, presence: true
  validate :req_type

  before_save :destroy_image?

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  def req_type
    if [self.career, self.learning, self.hobby].reject(&:blank?).size == 0
      errors[:base] << ("Opportunity type required.")
    end
  end

private
  def destroy_image?
    self.avatar.clear if @image_delete == "1"
  end
end
