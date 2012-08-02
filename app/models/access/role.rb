module Access
  class Role < ActiveRecord::Base
    attr_accessible :name, :description
    has_many :assignments
    has_many :users, :through => :assignments
    has_many :permissions
    has_many :operations, :through => :permissions
  end
end
