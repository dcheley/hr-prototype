class AddAttachmentAvatarToOpportunities < ActiveRecord::Migration
  def self.up
    change_table :opportunities do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :opportunities, :avatar
  end
end
