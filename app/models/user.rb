class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create }
  validates :email, uniqueness: true
end
