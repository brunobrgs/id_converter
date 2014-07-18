class TariffMasterPrice < ActiveRecord::Base
  belongs_to :master_distributor_contract
  belongs_to :tariff_operator
end
