class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.date :expire
      t.string :name_bank

      t.timestamps
    end
  end
end
