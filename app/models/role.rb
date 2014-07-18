class Role < ActiveRecord::Base
  belongs_to :related, polymorphic: true
  belongs_to :permit
end
