class AddAttachmentPictureToDebates < ActiveRecord::Migration
  def self.up
    change_table :debates do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :debates, :picture
  end
end
