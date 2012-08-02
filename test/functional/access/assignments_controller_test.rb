require 'test_helper'

module Access
  class AssignmentsControllerTest < ActionController::TestCase

    setup do
      @assignment = access_assignments(:one)
    end
  
    test "should get index" do
      get :index, :use_route => :access
      assert_response :success
      assert_not_nil assigns(:assignments)
    end
  
    test "should get new" do
      get :new, :use_route => :access
      assert_response :success
    end

    test "should create assignment" do
      assert_difference('Assignment.count') do
        post :create, assignment: {  }, :use_route => :access 
      end
      assert_redirected_to assignment_path(assigns(:assignment))
    end

    test "should show assignment" do
      get :show, id: @assignment, :use_route => :access 
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :use_route => :access, id: @assignment
      assert_response :success
    end
  
    test "should update assignment" do
      put :update, :use_route => :access, id: @assignment, assignment: {  }
      assert_redirected_to assignment_path(assigns(:assignment))
    end

    test "should destroy assignment" do
      assert_difference('Assignment.count', -1) do
        delete :destroy, :use_route => :access, id: @assignment
      end
      assert_redirected_to assignments_path
    end

  end
end
