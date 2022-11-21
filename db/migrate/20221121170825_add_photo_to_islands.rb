class AddPhotoToIslands < ActiveRecord::Migration[7.0]
  def change
    add_column :islands, :photo, :string
  end
end
