class ServiceTariff < ActiveRecord::Base
  belongs_to :tariff_operator
  belongs_to :service
end
