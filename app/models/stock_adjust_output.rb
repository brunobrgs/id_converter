class StockAdjustOutput < ActiveRecord::Base
  belongs_to :stock_adjust
  belongs_to :stock_product
end
