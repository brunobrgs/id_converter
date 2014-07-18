class TicketFlow < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :responsible, polymorphic: true
end
