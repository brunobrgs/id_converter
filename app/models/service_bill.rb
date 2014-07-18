class ServiceBill < ActiveRecord::Base
  belongs_to :line_bill
  belongs_to :associate_line_service
  has_one :service, through: :associate_line_service
end
