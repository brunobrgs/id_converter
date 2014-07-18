class ProductMatrix < ActiveRecord::Base
  belongs_to :commercial_table
  belongs_to :product_level
end
