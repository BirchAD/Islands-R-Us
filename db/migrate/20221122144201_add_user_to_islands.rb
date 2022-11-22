class AddUserToIslands < ActiveRecord::Migration[7.0]
  def change
    add_reference :islands, :user, null: false, foreign_key: true
  end
end
