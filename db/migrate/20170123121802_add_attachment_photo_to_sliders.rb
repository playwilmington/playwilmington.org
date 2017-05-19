class AddAttachmentPhotoToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :sliders, :photo
  end
end
