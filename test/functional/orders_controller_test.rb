require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should not get new order without cart" do
    get :new
    assert_redirected_to store_path
    assert_not_nil flash[:notice]
  end

  test "should get new" do
    cart = Cart.create
    LineItem.create(cart: cart, product: products(:ruby), price: 10.50)

    get :new, {}, {cart_id: cart.id}
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: @order.attributes
    end

    assert_redirected_to store_path
  end

  test "should show order" do
    get :show, id: @order.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order.to_param
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order.to_param, order: @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order.to_param
    end

    assert_redirected_to orders_path
  end
end