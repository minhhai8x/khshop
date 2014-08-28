require 'test_helper'

class SystemConfigsControllerTest < ActionController::TestCase
  setup do
    @system_config = system_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_config" do
    assert_difference('SystemConfig.count') do
      post :create, system_config: { backend_lang: @system_config.backend_lang, country: @system_config.country, currency: @system_config.currency, frontend_lang: @system_config.frontend_lang, google_access_id: @system_config.google_access_id, google_analytic_id: @system_config.google_analytic_id, google_bucket: @system_config.google_bucket, google_secret_key: @system_config.google_secret_key, is_description: @system_config.is_description, is_viewer: @system_config.is_viewer, number_bestbuy: @system_config.number_bestbuy, number_bestsell: @system_config.number_bestsell, number_category: @system_config.number_category }
    end

    assert_redirected_to system_config_path(assigns(:system_config))
  end

  test "should show system_config" do
    get :show, id: @system_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_config
    assert_response :success
  end

  test "should update system_config" do
    patch :update, id: @system_config, system_config: { backend_lang: @system_config.backend_lang, country: @system_config.country, currency: @system_config.currency, frontend_lang: @system_config.frontend_lang, google_access_id: @system_config.google_access_id, google_analytic_id: @system_config.google_analytic_id, google_bucket: @system_config.google_bucket, google_secret_key: @system_config.google_secret_key, is_description: @system_config.is_description, is_viewer: @system_config.is_viewer, number_bestbuy: @system_config.number_bestbuy, number_bestsell: @system_config.number_bestsell, number_category: @system_config.number_category }
    assert_redirected_to system_config_path(assigns(:system_config))
  end

  test "should destroy system_config" do
    assert_difference('SystemConfig.count', -1) do
      delete :destroy, id: @system_config
    end

    assert_redirected_to system_configs_path
  end
end
