class Badge < ApplicationRecord
  belongs_to :users

  validates :name, presence: true
end
