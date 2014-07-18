class StockAdjust < ActiveRecord::Base
  belongs_to :stock_operation
  belongs_to :distributor
  belongs_to :user
  has_many :stock_adjust_entries, dependent: :destroy
  has_many :stock_adjust_outputs, dependent: :destroy
end
