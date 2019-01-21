class Resolvers::AddToCart < GraphQL::Function
  argument :cart_id, !types.Int
  argument :items, !types[types.String]

  type Types::CartType

  def call(_obj, args, _ctx)
    cart = Cart.find(args[:cart_id])
    orders = cart.orders
    for item in args[:items]||[]
      title, quantity = item.split(':')
      product = Product.where(title:title).first
      order_exists = orders.find_by(product: product)
      if (order_exists)
	order_exists.update(quantity: order_exists.quantity + quantity.to_i)
      else
        order = Order.create(product:product, quantity:quantity.to_i)
        orders.push(order)
      end
    end
    cart.update(orders: orders)
    Cart.find(args[:cart_id])
  end
end
