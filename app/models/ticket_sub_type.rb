class TicketSubType < ActiveRecord::Base
  belongs_to :ticket_type
end
