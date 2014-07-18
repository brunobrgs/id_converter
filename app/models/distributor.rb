class Distributor < ActiveRecord::Base
  belongs_to :brand
  belongs_to :master, class_name: 'Distributor', foreign_key: :master_id

  default_scope { order('master_id DESC, id ASC') }
end
