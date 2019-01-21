class Resolvers::CheckOut < GraphQL::Function
  argument :cart_id, types.Int

  type Types::CartType

  def call(_obj, args, _ctx)
    cart_orders = Cart.find(args[:cart_id]).orders
    cart_orders.each do |order|
       order.product.update(inventory_count: order.product.inventory_count - order.quantity)
       order.destroy
    end
    Cart.find(args[:cart_id])
  end
end
