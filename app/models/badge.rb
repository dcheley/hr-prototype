class Badge < ApplicationRecord
  belongs_to :users, optional: true

  validates :name, presence: true

  before_save :falsify_others

  def falsify_others
    Badge.where('id != ? and default', self.id).update_all("default = 'false'")
  end
end
