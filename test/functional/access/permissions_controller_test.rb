require 'test_helper'

module Access
  class PermissionsControllerTest < ActionController::TestCase

    setup do
      @permission = access_permissions(:one)
    end
  
    test "should get index" do
      get :index, :use_route => :access  
      assert_response :success
      assert_not_nil assigns(:permissions)
    end
  
    test "should get new" do
      get :new, :use_route => :access  
      assert_response :success
    end
  
    test "should create permission" do
      assert_difference('Permission.count') do
        post :create, permission: {  }, :use_route => :access  
      end
      assert_redirected_to permission_path(assigns(:permission))
    end
  
    test "should show permission" do
      get :show, id: @permission, :use_route => :access  
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @permission, :use_route => :access  
      assert_response :success
    end
  
    test "should update permission" do
      put :update, id: @permission, permission: {  }, :use_route => :access  
      assert_redirected_to permission_path(assigns(:permission))
    end
  
    test "should destroy permission" do
      assert_difference('Permission.count', -1) do
        delete :destroy, id: @permission, :use_route => :access  
      end
      assert_redirected_to permissions_path
    end

  end
end
