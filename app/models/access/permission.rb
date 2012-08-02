module Access
  class Permission < ActiveRecord::Base
    belongs_to :role
    belongs_to :operation
    # attr_accessible :title, :body
  end
end
