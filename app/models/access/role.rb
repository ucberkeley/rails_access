module Access
  class Role < ActiveRecord::Base
    attr_accessible :description, :name
  end
end
