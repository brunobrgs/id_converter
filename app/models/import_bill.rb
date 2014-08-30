class ImportBill < ActiveRecord::Base
  belongs_to :bill_period
  belongs_to :user
end
