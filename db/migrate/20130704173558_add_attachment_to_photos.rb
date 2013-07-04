class AddAttachmentToPhotos < ActiveRecord::Migration
  def change
    add_attachment :photos, :gadget_photo
  end
end
