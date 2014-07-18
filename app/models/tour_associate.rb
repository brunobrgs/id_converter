class TourAssociate < ActiveRecord::Base
  belongs_to :tour
  belongs_to :owner, polymorphic: true
end
