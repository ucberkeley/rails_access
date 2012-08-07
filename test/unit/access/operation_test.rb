require 'test_helper'

module Access
  class OperationTest < ActiveSupport::TestCase

    test "add and subtract a role" do
      operation = Operation.new
      role = Role.new
      assert_equal([], operation.roles)
      operation.roles += [role]
      assert_equal([role], operation.roles)
      operation.roles -= [role]
      assert_equal([], operation.roles)
    end

  end
end
