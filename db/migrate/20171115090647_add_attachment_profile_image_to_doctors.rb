class AddAttachmentProfileImageToDoctors < ActiveRecord::Migration
  def self.up
    change_table :doctors do |t|
      t.attachment :profile_image
    end
  end

  def self.down
    remove_attachment :doctors, :profile_image
  end
end
