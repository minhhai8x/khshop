require 'test_helper'

class Admin::BannerConfigsControllerTest < ActionController::TestCase
  setup do
    @admin_banner_config = admin_banner_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_banner_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_banner_config" do
    assert_difference('Admin::BannerConfig.count') do
      post :create, admin_banner_config: { bn_max_large: @admin_banner_config.bn_max_large, bn_max_small: @admin_banner_config.bn_max_small, bn_pause: @admin_banner_config.bn_pause, bn_random: @admin_banner_config.bn_random, bn_speed: @admin_banner_config.bn_speed, bn_width: @admin_banner_config.bn_width }
    end

    assert_redirected_to admin_banner_config_path(assigns(:admin_banner_config))
  end

  test "should show admin_banner_config" do
    get :show, id: @admin_banner_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_banner_config
    assert_response :success
  end

  test "should update admin_banner_config" do
    patch :update, id: @admin_banner_config, admin_banner_config: { bn_max_large: @admin_banner_config.bn_max_large, bn_max_small: @admin_banner_config.bn_max_small, bn_pause: @admin_banner_config.bn_pause, bn_random: @admin_banner_config.bn_random, bn_speed: @admin_banner_config.bn_speed, bn_width: @admin_banner_config.bn_width }
    assert_redirected_to admin_banner_config_path(assigns(:admin_banner_config))
  end

  test "should destroy admin_banner_config" do
    assert_difference('Admin::BannerConfig.count', -1) do
      delete :destroy, id: @admin_banner_config
    end

    assert_redirected_to admin_banner_configs_path
  end
end
