class Bill < ActiveRecord::Base
  belongs_to :line_bill
  belongs_to :plan_line, polymorphic: true
end
