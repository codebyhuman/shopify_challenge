class Order < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  after_initialize :validate_and_calculate_order

  def validate_and_calculate_order
    if (self.quantity>self.product.inventory_count)
      raise GraphQL::ExecutionError.new("Trying to retrieve more products than there are! There are only #{self.product.inventory_count} of #{self.product.title} and you want #{self.quantity}! Too greedy :(")
    end
      self.price = self.product.price * self.quantity
  end
end
