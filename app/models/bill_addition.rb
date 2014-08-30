class BillAddition < ActiveRecord::Base
  attr_accessible :bill_addition_type_id, :destiny_type, :destiny_id, :value,
  belongs_to :bill_addition_type
  belongs_to :bill_period
  belongs_to :destiny, polymorphic: true
  belongs_to :distributor
end
