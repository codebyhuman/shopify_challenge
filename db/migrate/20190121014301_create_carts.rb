class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.float :total_cost

      t.timestamps
    end
  end
end
