class MasterDistributorContract < ActiveRecord::Base
  a
  belongs_to :master, class_name: 'Distributor'
  belongs_to :distributor
end
