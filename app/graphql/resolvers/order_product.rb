class Resolvers::OrderProduct < GraphQL::Function
  argument :product, !types.String
  argument :quantity, !types.Int

  type Types::OrderType

  def call(_obj, args, _ctx)
    product = Product.find_by(title: args[:product])
    Order.create(quantity: args[:quantity], product: product)
  end
end
