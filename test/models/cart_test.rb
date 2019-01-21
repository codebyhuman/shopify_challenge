require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def perform(args={})
    Resolvers::CreateCart.new.call(nil,args,{})
  end   

  test 'Creating new cart' do
    cart = perform({items:["Apple:1"]})
    assert_equal cart.orders.length, 1
    assert_equal cart.orders[0].product.title, "Apple"
  end

  test 'Creating invalid cart' do
    assert_raise(GraphQL::ExecutionError) {cart = perform({items:["Orange:1"]})}
  end

  test 'Completing a cart' do
    cart = perform({items:["Apple:1"]})
    Resolvers::CheckOut.new.call(nil, {cart_id:cart.id}, {})
    assert_equal Product.where(title:"Apple").first.inventory_count, 1
  end

end
