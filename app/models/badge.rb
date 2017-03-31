class Badge < ApplicationRecord
  belongs_to :users, optional: true

  validates :name, presence: true
end
