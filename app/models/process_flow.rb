class ProcessFlow < ActiveRecord::Base
  belongs_to :process_manager
  belongs_to :process_step
  belongs_to :responsible, class_name: 'User', foreign_key: :responsible_id
end
