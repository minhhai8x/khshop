require 'test_helper'

class Admin::StoresControllerTest < ActionController::TestCase
  setup do
    @admin_store = admin_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_store" do
    assert_difference('Admin::Store.count') do
      post :create, admin_store: { c_link: @admin_store.c_link, c_trade: @admin_store.c_trade, c_year: @admin_store.c_year, s_acc_skype: @admin_store.s_acc_skype, s_acc_tw: @admin_store.s_acc_tw, s_address: @admin_store.s_address, s_description: @admin_store.s_description, s_email: @admin_store.s_email, s_fb_appid: @admin_store.s_fb_appid, s_fb_link: @admin_store.s_fb_link, s_fb_name: @admin_store.s_fb_name, s_fb_title: @admin_store.s_fb_title, s_logo: @admin_store.s_logo, s_name: @admin_store.s_name, s_phone: @admin_store.s_phone, s_sitemap: @admin_store.s_sitemap }
    end

    assert_redirected_to admin_store_path(assigns(:admin_store))
  end

  test "should show admin_store" do
    get :show, id: @admin_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_store
    assert_response :success
  end

  test "should update admin_store" do
    patch :update, id: @admin_store, admin_store: { c_link: @admin_store.c_link, c_trade: @admin_store.c_trade, c_year: @admin_store.c_year, s_acc_skype: @admin_store.s_acc_skype, s_acc_tw: @admin_store.s_acc_tw, s_address: @admin_store.s_address, s_description: @admin_store.s_description, s_email: @admin_store.s_email, s_fb_appid: @admin_store.s_fb_appid, s_fb_link: @admin_store.s_fb_link, s_fb_name: @admin_store.s_fb_name, s_fb_title: @admin_store.s_fb_title, s_logo: @admin_store.s_logo, s_name: @admin_store.s_name, s_phone: @admin_store.s_phone, s_sitemap: @admin_store.s_sitemap }
    assert_redirected_to admin_store_path(assigns(:admin_store))
  end

  test "should destroy admin_store" do
    assert_difference('Admin::Store.count', -1) do
      delete :destroy, id: @admin_store
    end

    assert_redirected_to admin_stores_path
  end
end
