class ProductModel < ActiveRecord::Base
  belongs_to :product_fabricator
  belongs_to :chip_type, class_name: 'ProductModel', foreign_key: :chip_type_id

  default_scope { order('chip_type_id DESC, id ASC') }
end
