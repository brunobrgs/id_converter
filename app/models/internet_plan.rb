class InternetPlan < ActiveRecord::Base
  attr_accessible :bytes_amount, :cost_value, :display_name, :end_term, :name, :signature, :start_term,
    :distributor_ids, :commercial_table_id
  attr_list :name, :signature, :bytes_amount, :start_term, :end_term
  attr_search :name
  attr_filter :active_filter
  belongs_to :commercial_table
  has_many :distributor_internet_plans
  has_many :distributors, through: :distributor_internet_plans
  has_many :sell_internet_items, dependent: :restrict_with_exception
  has_many :negotiation_internets, dependent: :restrict_with_exception
  validates :cost_value, :end_term, :name, :signature, :start_term, :commercial_table_id,
    presence: true
  validates :bytes_amount, presence: true, numericality: true
  scope :from_distributors, -> distributor_ids { joins{ distributor_internet_plans }.where{ distributor_internet_plans.distributor_id.in(distributor_ids) } }
  scope :active, -> { where{ (disable_date.eq(nil)) & (end_term.gt(Date.current)) } }
  scope :inactive, -> { where{ (disable_date.not_eq(nil)) | (end_term.lt(Date.current)) } }
  scope :to_sell, -> distributor_ids, commercial_table_id {
    from_distributors(distributor_ids).from_commercial_table(commercial_table_id).active.uniq
  }
  scope :from_negotiation, -> negotiation_id {
    joins { negotiation_internets }.where {
      negotiation_internets.negotiation_id.eq negotiation_id
    }.uniq
  }
  scope :from_commercial_table, -> value {
    where { commercial_table_id.eq value }
  }
  orderize :name
  def to_s
    name || display_name
  end
  def active?
    (expired? || disabled?) ? false : true
  end
  def expired?
    end_term < Date.current
  end
  def disabled?
    true if disable_date
  end
  def disable
    if disabled?
      errors.add(:disable_date, :already_disabled)
      false
    else
      self.disable_date  = Date.current
      self.save
    end
  end
end
