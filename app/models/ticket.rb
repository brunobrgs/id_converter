class Ticket < ActiveRecord::Base
  belongs_to :ticket_contact_type
  belongs_to :ticket_sub_type
  belongs_to :associate
  belongs_to :requestor, polymorphic: true
  belongs_to :user, -> { joins { tickets }.where { tickets.requestor_type.eq('User') } },
    foreign_key: 'requestor_id'
  belongs_to :associate_user, -> { joins { tickets }.where { tickets.requestor_type.eq('AssociateUser') } },
    foreign_key: 'requestor_id'
end
