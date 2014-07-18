class MasterManagerContract < ActiveRecord::Base
  belongs_to :distributor
  belongs_to :manager
end
