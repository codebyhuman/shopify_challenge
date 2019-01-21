Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'

  field :price, !types.Float
  field :quantity, !types.Int
  field :product, Types::ProductType
end
