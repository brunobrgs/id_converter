class Invoice < ActiveRecord::Base
  belongs_to :request
  belongs_to :user_confirmation, class_name: 'User', foreign_key: :user_confirmation_id
end
