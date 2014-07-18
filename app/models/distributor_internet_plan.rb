class DistributorInternetPlan < ActiveRecord::Base
  belongs_to :internet_plan, dependent: :destroy
  belongs_to :distributor, dependent: :destroy
end
