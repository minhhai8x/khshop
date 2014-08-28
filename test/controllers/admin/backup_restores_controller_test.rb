require 'test_helper'

class Admin::BackupRestoresControllerTest < ActionController::TestCase
  setup do
    @admin_backup_restore = admin_backup_restores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_backup_restores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_backup_restore" do
    assert_difference('Admin::BackupRestore.count') do
      post :create, admin_backup_restore: { br_note: @admin_backup_restore.br_note, br_reason: @admin_backup_restore.br_reason, br_status: @admin_backup_restore.br_status, br_userid: @admin_backup_restore.br_userid }
    end

    assert_redirected_to admin_backup_restore_path(assigns(:admin_backup_restore))
  end

  test "should show admin_backup_restore" do
    get :show, id: @admin_backup_restore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_backup_restore
    assert_response :success
  end

  test "should update admin_backup_restore" do
    patch :update, id: @admin_backup_restore, admin_backup_restore: { br_note: @admin_backup_restore.br_note, br_reason: @admin_backup_restore.br_reason, br_status: @admin_backup_restore.br_status, br_userid: @admin_backup_restore.br_userid }
    assert_redirected_to admin_backup_restore_path(assigns(:admin_backup_restore))
  end

  test "should destroy admin_backup_restore" do
    assert_difference('Admin::BackupRestore.count', -1) do
      delete :destroy, id: @admin_backup_restore
    end

    assert_redirected_to admin_backup_restores_path
  end
end
