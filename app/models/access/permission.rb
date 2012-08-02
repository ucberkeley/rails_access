module Access
  class Permission < ActiveRecord::Base
    belongs_to :role
    belongs_to :operation
  end
end
