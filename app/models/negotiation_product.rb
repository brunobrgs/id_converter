class NegotiationProduct < ActiveRecord::Base
  belongs_to :negotiation
  belongs_to :product_model
  belongs_to :color
end
