class DistributorStockOperation < ActiveRecord::Base
  self.table_name = 'distributors_stock_operations'
  belongs_to :distributor
  belongs_to :stock_operation
end
