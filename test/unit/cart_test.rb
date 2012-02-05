require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "run add_product properly" do 
    @cart = carts(:one)
    assert_equal @cart.line_items.size, 0
    @cart.add_product(products(:two).id, 15.00).save
    assert_equal @cart.line_items.size, 1

    @cart.add_product(products(:one).id, 15.00).save
    assert_equal @cart.line_items.size, 2

    @cart.add_product(products(:one).id, 15.00).save
    assert_equal @cart.line_items.size, 2
    assert_equal @cart.line_items.find(:first, conditions: "product_id = #{products(:one).id}").quantity, 2
  end

  test "run delete_product properly" do 
    @cart = carts(:one)
    assert_equal @cart.line_items.size, 0
    @cart.add_product(products(:two).id, 15.00).save
    @cart.add_product(products(:two).id, 15.00).save
    assert_equal @cart.line_items.size, 1

    @cart.delete_product(products(:two).id)
    assert_equal @cart.line_items.size, 1
    assert_equal @cart.line_items.find(:first, conditions: "product_id = #{products(:two).id}").quantity, 1

    @cart.delete_product(products(:two).id)
    assert_equal @cart.line_items.size, 0
    assert_nil @cart.line_items.find(:first, conditions: "product_id = #{products(:two).id}")
  end
end
