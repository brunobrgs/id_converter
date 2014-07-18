class PlanShift < ActiveRecord::Base
  belongs_to :associate
  belongs_to :plan
  belongs_to :distributor
  belongs_to :user
end
