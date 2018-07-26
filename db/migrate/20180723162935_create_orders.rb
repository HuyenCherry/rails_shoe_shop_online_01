class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :address
      t.boolean :status
      t.integer :payment_type
      t.integer :subtotal
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
