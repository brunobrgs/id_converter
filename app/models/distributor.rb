class Distributor < ActiveRecord::Base
  belongs_to :brand
  belongs_to :master, class_name: 'Distributor', foreign_key: :master_id

  default_scope { order('owner_brand DESC, id ASC') }
end
