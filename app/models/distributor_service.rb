class DistributorService < ActiveRecord::Base
  belongs_to :distributor, dependent: :destroy
  belongs_to :service, dependent: :destroy
end
