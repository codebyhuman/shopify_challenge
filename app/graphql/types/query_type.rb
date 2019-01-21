Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :fetchAllProducts, !types[Types::ProductType] do
    argument :available, types.Boolean, required=false
    description "Query all products"
    resolve ->(obj, args, ctx) {
	 if (args[:available])
		Product.all.where("inventory_count>0")
         else
		Product.all
	 end
    }
  end

  field :fetchOneProduct, Types::ProductType do
    argument :title, types.String
	resolve ->(obj, args, ctx) {
	  Product.find_by(title: args[:title])
	}
  end

  field :fetchAllOrders, !types[Types::OrderType] do
    resolve ->(obj, args, ctx) {
      Order.all
    }
  end

  field :fetchAllCarts, !types[Types::CartType] do
    resolve ->(obj, args, ctx) {
      Cart.all
    }
  end
end
