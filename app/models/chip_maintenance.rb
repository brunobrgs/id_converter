class ChipMaintenance < ActiveRecord::Base
  belongs_to :chip_maintenance_type
  belongs_to :number
  belongs_to :stock_product
end
