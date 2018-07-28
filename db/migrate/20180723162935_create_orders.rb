class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :address
      t.boolean :status
      t.integer :payment_type
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
