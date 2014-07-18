class TariffOperator < ActiveRecord::Base
  belongs_to :operator
  belongs_to :tariff
end
