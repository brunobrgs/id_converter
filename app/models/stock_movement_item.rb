class StockMovementItem < ActiveRecord::Base
  belongs_to :stock_movement
  belongs_to :product_model
end
