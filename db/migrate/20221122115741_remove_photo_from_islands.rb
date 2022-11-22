class RemovePhotoFromIslands < ActiveRecord::Migration[7.0]
  def change
    remove_column :islands, :photo, :string
  end
end
