class SellPlanItemService < ActiveRecord::Base
  belongs_to :service
  belongs_to :sell_plan_item
end
