class NegotiationService < ActiveRecord::Base
  belongs_to :negotiation
  belongs_to :service
end
