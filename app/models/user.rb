class User < ApplicationRecord
  has_secure_password
  acts_as_voter
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  has_one :signup
  has_many :badges
  has_many :opportunities, through: :badges
  has_many :received_badges, class_name: :Recognition, foreign_key: :receiver_id
  has_many :given_badges, class_name: :Recognition, foreign_key: :recognizer_id

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :password, length: { minimum: 6, :on => :create }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create }
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :job_description, length: {maximum: 500}

  accepts_nested_attributes_for :badges

  def self.search(search)
    joins(:badges)
    .where("badges.name ILIKE ? OR users.name ILIKE ?", "%#{search}", "%#{search}")
    .references(:badges)
  end

  before_save :destroy_image?

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

private
  def destroy_image?
    self.avatar.clear if @image_delete == "1"
  end
end
