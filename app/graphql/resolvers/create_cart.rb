class Resolvers::CreateCart < GraphQL::Function
  argument :items, types[types.String], required=false

  type Types::CartType

  def call(_obj, args, _ctx)
    new_cart = []
    for item in args[:items]||[]
      title, quantity = item.split(':')
      product = Product.where(title:title).first
      order = Order.create(product:product, quantity:quantity.to_i)
      new_cart.push(order)
    end
    Cart.create(orders:new_cart)
    
  end
end
