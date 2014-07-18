class Associate < ActiveRecord::Base
  belongs_to :partner
  belongs_to :distributor
end
