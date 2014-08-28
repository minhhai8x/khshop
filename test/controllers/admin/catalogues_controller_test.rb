require 'test_helper'

class Admin::CataloguesControllerTest < ActionController::TestCase
  setup do
    @admin_catalogue = admin_catalogues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_catalogues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_catalogue" do
    assert_difference('Admin::Catalogue.count') do
      post :create, admin_catalogue: { name: @admin_catalogue.name }
    end

    assert_redirected_to admin_catalogue_path(assigns(:admin_catalogue))
  end

  test "should show admin_catalogue" do
    get :show, id: @admin_catalogue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_catalogue
    assert_response :success
  end

  test "should update admin_catalogue" do
    patch :update, id: @admin_catalogue, admin_catalogue: { name: @admin_catalogue.name }
    assert_redirected_to admin_catalogue_path(assigns(:admin_catalogue))
  end

  test "should destroy admin_catalogue" do
    assert_difference('Admin::Catalogue.count', -1) do
      delete :destroy, id: @admin_catalogue
    end

    assert_redirected_to admin_catalogues_path
  end
end
