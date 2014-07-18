class FranchiseMovement < ActiveRecord::Base
  belongs_to :origin, class_name: 'LineBill', foreign_key: :origin_line_bill_id
  belongs_to :destiny, class_name: 'LineBill', foreign_key: :destiny_line_bill_id
  belongs_to :owner, polymorphic: true
end
