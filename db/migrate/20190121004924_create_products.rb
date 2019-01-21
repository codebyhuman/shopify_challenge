class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :inventory_count
      t.float :price
      t.string :title
      t.references :cart, foreign_key: true
      t.timestamps
    end
  end
end
