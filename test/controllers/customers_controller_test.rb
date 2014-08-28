require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { cus_address: @customer.cus_address, cus_email: @customer.cus_email, cus_image: @customer.cus_image, cus_name: @customer.cus_name, cus_oauth: @customer.cus_oauth, cus_phone: @customer.cus_phone, cus_points: @customer.cus_points, cus_status: @customer.cus_status }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { cus_address: @customer.cus_address, cus_email: @customer.cus_email, cus_image: @customer.cus_image, cus_name: @customer.cus_name, cus_oauth: @customer.cus_oauth, cus_phone: @customer.cus_phone, cus_points: @customer.cus_points, cus_status: @customer.cus_status }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
