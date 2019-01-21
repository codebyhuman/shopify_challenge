Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'

  field :title, !types.String
  field :price, !types.Float
  field :inventory_count, !types.Int
end