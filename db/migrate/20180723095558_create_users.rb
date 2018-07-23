class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth_date
      t.string :email
      t.string :phone
      t.integer :role
      t.string :username
      t.string :password
      t.text :address

      t.timestamps
    end
  end
end
