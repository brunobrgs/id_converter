class ServiceOperation < ActiveRecord::Base
  belongs_to :user
  belongs_to :associate
end
