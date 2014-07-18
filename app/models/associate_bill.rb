class AssociateBill < ActiveRecord::Base
  belongs_to :bill_period
  belongs_to :associate
end
