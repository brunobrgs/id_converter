class ProcessStepResponsible < ActiveRecord::Base
  belongs_to :process_step
  belongs_to :user
end
