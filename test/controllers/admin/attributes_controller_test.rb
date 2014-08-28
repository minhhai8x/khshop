require 'test_helper'

class Admin::AttributesControllerTest < ActionController::TestCase
  setup do
    @admin_attribute = admin_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_attribute" do
    assert_difference('Admin::Attribute.count') do
      post :create, admin_attribute: { description: @admin_attribute.description, name: @admin_attribute.name, orderby: @admin_attribute.orderby, product_id: @admin_attribute.product_id }
    end

    assert_redirected_to admin_attribute_path(assigns(:admin_attribute))
  end

  test "should show admin_attribute" do
    get :show, id: @admin_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_attribute
    assert_response :success
  end

  test "should update admin_attribute" do
    patch :update, id: @admin_attribute, admin_attribute: { description: @admin_attribute.description, name: @admin_attribute.name, orderby: @admin_attribute.orderby, product_id: @admin_attribute.product_id }
    assert_redirected_to admin_attribute_path(assigns(:admin_attribute))
  end

  test "should destroy admin_attribute" do
    assert_difference('Admin::Attribute.count', -1) do
      delete :destroy, id: @admin_attribute
    end

    assert_redirected_to admin_attributes_path
  end
end
