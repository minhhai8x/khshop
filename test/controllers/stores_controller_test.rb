require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: { c_link: @store.c_link, c_trade: @store.c_trade, c_year: @store.c_year, s_acc_skype: @store.s_acc_skype, s_acc_tw: @store.s_acc_tw, s_address: @store.s_address, s_description: @store.s_description, s_email: @store.s_email, s_fb_appid: @store.s_fb_appid, s_fb_link: @store.s_fb_link, s_fb_name: @store.s_fb_name, s_fb_title: @store.s_fb_title, s_logo: @store.s_logo, s_name: @store.s_name, s_phone: @store.s_phone, s_sitemap: @store.s_sitemap }
    end

    assert_redirected_to store_path(assigns(:store))
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store
    assert_response :success
  end

  test "should update store" do
    patch :update, id: @store, store: { c_link: @store.c_link, c_trade: @store.c_trade, c_year: @store.c_year, s_acc_skype: @store.s_acc_skype, s_acc_tw: @store.s_acc_tw, s_address: @store.s_address, s_description: @store.s_description, s_email: @store.s_email, s_fb_appid: @store.s_fb_appid, s_fb_link: @store.s_fb_link, s_fb_name: @store.s_fb_name, s_fb_title: @store.s_fb_title, s_logo: @store.s_logo, s_name: @store.s_name, s_phone: @store.s_phone, s_sitemap: @store.s_sitemap }
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_redirected_to stores_path
  end
end
