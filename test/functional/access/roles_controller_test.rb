require 'test_helper'

module Access
  class RolesControllerTest < ActionController::TestCase

    setup do
      @role = access_roles(:one)
    end
  
    test "should get index" do
      get :index, :use_route => :access  
      assert_response :success
      assert_not_nil assigns(:roles)
    end
  
    test "should get new" do
      get :new, :use_route => :access  
      assert_response :success
    end
  
    test "should create role" do
      assert_difference('Role.count') do
        post :create, role: { description: @role.description, name: @role.name }, :use_route => :access  
      end  
      assert_redirected_to role_path(assigns(:role))
    end
  
    test "should show role" do
      get :show, id: @role, :use_route => :access  
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @role, :use_route => :access  
      assert_response :success
    end
  
    test "should update role" do
      put :update, id: @role, role: { description: @role.description, name: @role.name }, :use_route => :access  
      assert_redirected_to role_path(assigns(:role))
    end
  
    test "should destroy role" do
      assert_difference('Role.count', -1) do
        delete :destroy, id: @role, :use_route => :access  
      end      
      assert_redirected_to roles_path
    end

  end
end
