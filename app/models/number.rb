class Number < ActiveRecord::Base
  has_paper_trail on: [:update], ignore: [:updated_at]
  belongs_to :operator
  belongs_to :distributor
  belongs_to :operator_account
  belongs_to :old_number, class_name: 'Number'
end
