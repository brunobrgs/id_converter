class RequestItem < ActiveRecord::Base
  belongs_to :request
  belongs_to :product_model
  belongs_to :color
  belongs_to :product_level
  belongs_to :chip_model, class_name: 'ProductModel'
end
