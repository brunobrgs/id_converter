class AssociateBonus < ActiveRecord::Base
  belongs_to :associate
  belongs_to :source,  polymorphic: true
end
