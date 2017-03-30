class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  has_many :badges

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :password, length: { minimum: 6, :on => :create }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create }
  validates :email, uniqueness: true
  validates :name, presence: true

  accepts_nested_attributes_for :badges
end
