class PlanTariff < ActiveRecord::Base
  belongs_to :plan
  belongs_to :tariff
end
