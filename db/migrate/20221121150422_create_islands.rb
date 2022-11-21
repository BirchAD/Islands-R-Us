class CreateIslands < ActiveRecord::Migration[7.0]
  def change
    create_table :islands do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
