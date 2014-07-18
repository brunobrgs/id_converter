class AssociateUserLine < ActiveRecord::Base
  belongs_to :associate_user
  belongs_to :associate_line
end
