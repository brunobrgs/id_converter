class ProcessManager < ActiveRecord::Base
  belongs_to :process_type
  belongs_to :associate
  belongs_to :distributor
  belongs_to :user
  belongs_to :source, polymorphic: true
end
