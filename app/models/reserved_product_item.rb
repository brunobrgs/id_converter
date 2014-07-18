class ReservedProductItem < ActiveRecord::Base
  belongs_to :reserved_product
  belongs_to :product_model
  belongs_to :color
end
