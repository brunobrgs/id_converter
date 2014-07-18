class ServiceOperationItem < ActiveRecord::Base
  belongs_to :service_operation
  belongs_to :associate_line
  belongs_to :service
  belongs_to :associate_line_service
end
