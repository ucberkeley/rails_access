module Access
  class Operation < ActiveRecord::Base
    attr_accessible :description, :name
  end
end
