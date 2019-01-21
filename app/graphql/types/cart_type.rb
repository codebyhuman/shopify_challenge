Types::CartType = GraphQL::ObjectType.define do
  name 'Cart'

  field :id, !types.Int
  field :total_cost, !types.Float
  field :orders, !types[Types::OrderType]
end
