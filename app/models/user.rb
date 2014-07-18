class User < ActiveRecord::Base
  belongs_to :group
  belongs_to :partner
end
