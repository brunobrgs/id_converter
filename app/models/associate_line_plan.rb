class AssociateLinePlan < ActiveRecord::Base
  belongs_to :associate_line
  belongs_to :plan_line, polymorphic: true
  belongs_to :facility_package
end
