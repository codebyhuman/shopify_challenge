Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :purchaseProduct, function: Resolvers::PurchaseProduct.new
  field :orderProducts, function: Resolvers::OrderProduct.new
  field :createCart, function: Resolvers::CreateCart.new
  field :addToCart, function: Resolvers::AddToCart.new
  field :checkOut, function: Resolvers::CheckOut.new
end
