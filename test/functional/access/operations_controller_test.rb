require 'test_helper'

module Access
  class OperationsControllerTest < ActionController::TestCase

    setup do
      #TODO change to use fixtures
      @operation = Operation.create!
    end
  
    test "should get index" do
      get :index, :use_route => :access  
      assert_response :success
      assert_not_nil assigns(:operations)
    end
  
    test "should get new" do
      get :new, :use_route => :access  
      assert_response :success
    end
  
    test "should create operation" do
      assert_difference('Operation.count') do
        post :create, operation: { description: @operation.description, name: @operation.name }, :use_route => :access  
      end
      assert_redirected_to operation_path(assigns(:operation))
    end
  
    test "should show operation" do
      get :show, id: @operation, :use_route => :access  
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @operation, :use_route => :access  
      assert_response :success
    end
  
    test "should update operation" do
      put :update, id: @operation, operation: { description: @operation.description, name: @operation.name }, :use_route => :access  
      assert_redirected_to operation_path(assigns(:operation))
    end
  
    test "should destroy operation" do
      assert_difference('Operation.count', -1) do
        delete :destroy, id: @operation, :use_route => :access  
      end
      assert_redirected_to operations_path
    end

  end
end
