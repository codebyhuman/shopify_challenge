class Resolvers::PurchaseProduct < GraphQL::Function
  argument :product, !types.String

  type Types::ProductType

  def call(_obj, args, _ctx)
    product = Product.where(title: args[:product]).first
	if (product.inventory_count > 0)
		product.update(inventory_count: product.inventory_count-1)
	end
	product
  end
end