class DistributorPlan < ActiveRecord::Base
  belongs_to :plan, dependent: :delete
  belongs_to :distributor, dependent: :delete
end
