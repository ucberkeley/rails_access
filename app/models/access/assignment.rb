module Access
  class Assignment < ActiveRecord::Base
    belongs_to :user
    belongs_to :role
  end
end
