class NumberShift < ActiveRecord::Base
  belongs_to :associate_line
  belongs_to :number
  belongs_to :user
end
