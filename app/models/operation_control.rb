class OperationControl < ActiveRecord::Base
  belongs_to :source, polymorphic: true
  belongs_to :creator, polymorphic: true
end
