class Manager < ActiveRecord::Base
  belongs_to :responsible, class_name: 'Partner', foreign_key: :partner_id
end
