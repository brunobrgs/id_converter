class Repayment < ActiveRecord::Base
  belongs_to :line_bill
  belongs_to :comodato
end
