class TariffOperatorPrice < ActiveRecord::Base
  belongs_to :master_operator_contract
  belongs_to :tariff_operator
end
