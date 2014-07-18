class TransferTitle < ActiveRecord::Base
  belongs_to :distributor
  belongs_to :associate
  belongs_to :user
end
