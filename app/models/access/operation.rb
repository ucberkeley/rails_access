module Access
  class Operation < ActiveRecord::Base
    attr_accessible :name, :description
    has_many :permissions
    has_many :roles, :through => :permissions
  end
end
