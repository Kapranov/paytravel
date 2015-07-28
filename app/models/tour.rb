class Tour < ActiveRecord::Base
  validates_uniqueness_of :contract
end
