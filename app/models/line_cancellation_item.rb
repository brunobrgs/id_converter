class LineCancellationItem < ActiveRecord::Base
  belongs_to :line_cancellation
  belongs_to :associate_line
end
