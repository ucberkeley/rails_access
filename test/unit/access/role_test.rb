require 'test_helper'
require_rel 'user_mock'

module Access
  class RoleTest < ActiveSupport::TestCase

    test "add and subtract a user" do
      role = Role.new
      user = User.new
      assert_equal([], role.users)
      role.users += [user]
      assert_equal([user], role.users)
      role.users -= [user]
      assert_equal([], role.users)
    end

    test "add and subtract an operation" do
      role = Role.new
      operation = Operation.new
      assert_equal([], role.operations)
      role.operations += [operation]
      assert_equal([operation], role.operations)
      role.operations -= [operation]
      assert_equal([], role.operations)
    end

  end
end
