class SellPlanItem < ActiveRecord::Base
  belongs_to :sell
  belongs_to :number
  belongs_to :negotiation_product
end
