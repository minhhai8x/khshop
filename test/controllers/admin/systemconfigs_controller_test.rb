require 'test_helper'

class Admin::SystemconfigsControllerTest < ActionController::TestCase
  setup do
    @admin_systemconfig = admin_systemconfigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_systemconfigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_systemconfig" do
    assert_difference('Admin::Systemconfig.count') do
      post :create, admin_systemconfig: { backend_lang: @admin_systemconfig.backend_lang, country: @admin_systemconfig.country, currency: @admin_systemconfig.currency, frontend_lang: @admin_systemconfig.frontend_lang, google_access_id: @admin_systemconfig.google_access_id, google_analytic_id: @admin_systemconfig.google_analytic_id, google_bucket: @admin_systemconfig.google_bucket, google_secret_key: @admin_systemconfig.google_secret_key, is_description: @admin_systemconfig.is_description, is_viewer: @admin_systemconfig.is_viewer, number_bestbuy: @admin_systemconfig.number_bestbuy, number_bestsell: @admin_systemconfig.number_bestsell, number_category: @admin_systemconfig.number_category }
    end

    assert_redirected_to admin_systemconfig_path(assigns(:admin_systemconfig))
  end

  test "should show admin_systemconfig" do
    get :show, id: @admin_systemconfig
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_systemconfig
    assert_response :success
  end

  test "should update admin_systemconfig" do
    patch :update, id: @admin_systemconfig, admin_systemconfig: { backend_lang: @admin_systemconfig.backend_lang, country: @admin_systemconfig.country, currency: @admin_systemconfig.currency, frontend_lang: @admin_systemconfig.frontend_lang, google_access_id: @admin_systemconfig.google_access_id, google_analytic_id: @admin_systemconfig.google_analytic_id, google_bucket: @admin_systemconfig.google_bucket, google_secret_key: @admin_systemconfig.google_secret_key, is_description: @admin_systemconfig.is_description, is_viewer: @admin_systemconfig.is_viewer, number_bestbuy: @admin_systemconfig.number_bestbuy, number_bestsell: @admin_systemconfig.number_bestsell, number_category: @admin_systemconfig.number_category }
    assert_redirected_to admin_systemconfig_path(assigns(:admin_systemconfig))
  end

  test "should destroy admin_systemconfig" do
    assert_difference('Admin::Systemconfig.count', -1) do
      delete :destroy, id: @admin_systemconfig
    end

    assert_redirected_to admin_systemconfigs_path
  end
end
