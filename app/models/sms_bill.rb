class SmsBill < ActiveRecord::Base
  belongs_to :import_bill
  belongs_to :service_bill
  belongs_to :number
end
