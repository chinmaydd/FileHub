class AddAttachmentDocToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :doc
    end
  end

  def self.down
    drop_attached_file :uploads, :doc
  end
end
