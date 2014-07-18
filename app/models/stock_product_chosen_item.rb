class StockProductChosenItem < ActiveRecord::Base
  belongs_to :stock_product_chosen
  belongs_to :reserved_product_item
  belongs_to :stock_product
end
