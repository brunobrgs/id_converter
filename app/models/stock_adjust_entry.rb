class StockAdjustEntry < ActiveRecord::Base
  belongs_to :stock_adjust
  belongs_to :product_model
  belongs_to :color
end
