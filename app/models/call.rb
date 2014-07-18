class Call < ActiveRecord::Base
  belongs_to :number
  belongs_to :tariff
  belongs_to :tariff_operator
  belongs_to :line_consumption
  belongs_to :bill_period
  belongs_to :import_call
end
