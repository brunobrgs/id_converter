class Block < ActiveRecord::Base
  belongs_to :destiny, polymorphic: true
  belongs_to :associate, foreign_key: :destiny_id
  belongs_to :associate_line, foreign_key: :destiny_id
end
