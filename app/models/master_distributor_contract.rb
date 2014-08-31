class MasterDistributorContract < ActiveRecord::Base
  belongs_to :master, class_name: 'Distributor'
  belongs_to :distributor
end
