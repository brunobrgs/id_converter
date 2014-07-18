class ProductModelColor < ActiveRecord::Base
  self.table_name = 'product_models_colors'

  belongs_to :product_model
  belongs_to :color
end
