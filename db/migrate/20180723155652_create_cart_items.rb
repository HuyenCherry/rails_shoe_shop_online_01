class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.string :order_item_type
      t.references :cart, foreign_key: true
      t.references :shoe, foreign_key: true

      t.timestamps
    end
  end
end
