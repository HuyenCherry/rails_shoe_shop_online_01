class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
