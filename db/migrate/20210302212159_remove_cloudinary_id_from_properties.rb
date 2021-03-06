class RemoveCloudinaryIdFromProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :cloudinary_id, :string
  end
end
