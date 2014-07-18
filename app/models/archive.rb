class Archive < ActiveRecord::Base
  belongs_to :archivable, polymorphic: true
end
