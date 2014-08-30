class TransferTitleItem < ActiveRecord::Base
  belongs_to :transfer_title
  belongs_to :associate_line
end
