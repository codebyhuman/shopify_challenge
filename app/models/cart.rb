class Cart < ApplicationRecord
    has_many :orders, dependent: :destroy
    after_initialize :calculate_total

    def calculate_total
	   orders = self.orders
	   sum = 0
	   orders.each do |order|
	     sum = sum + order.price
	   end
	   self.total_cost = sum
    end
end
