class Badge < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :opportunities, optional: true
  
  validates :name, presence: true
end
