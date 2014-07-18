class AssociateCancel < ActiveRecord::Base
  belongs_to :associate
  belongs_to :user
end
