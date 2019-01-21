require 'test_helper'

class ProductTypeTest < ActiveSupport::TestCase
  def perform(args = {})
    Types::QueryType.fields['fetchAllProducts'].resolve(nil, args, {})
  end

  test 'Querying all products' do
    products = perform()
    assert_equal products[0].title, "Orange"
    assert_equal products[1].title, "Apple"
    assert_equal products.length, 2
  end

  test 'Querying all available products' do
    products = perform({available:true})
    assert_equal products.length, 1
    assert_equal products[0].title, "Apple"
  end
end
