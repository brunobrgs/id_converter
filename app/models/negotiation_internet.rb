class NegotiationInternet < ActiveRecord::Base
  belongs_to :negotiation
  belongs_to :internet_plan
end
