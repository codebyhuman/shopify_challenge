class AddCartIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cart_id, :integer
    add_index :orders, :cart_id
  end
end
