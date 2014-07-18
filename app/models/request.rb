class Request < ActiveRecord::Base
  belongs_to :distributor
  belongs_to :stock_operation
  belongs_to :operator
  belongs_to :request_type
end
