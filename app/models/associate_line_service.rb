class AssociateLineService < ActiveRecord::Base
  belongs_to :associate_line
  belongs_to :service
end
