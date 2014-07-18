class BillDiscount < ActiveRecord::Base
  belongs_to :bill_discount_type
  belongs_to :bill_period
  belongs_to :destiny, polymorphic: true
  belongs_to :user
end
