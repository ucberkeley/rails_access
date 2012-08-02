module Access
  class Assignment < ActiveRecord::Base
    belongs_to :user
    belongs_to :role
    # attr_accessible :title, :body
  end
end
