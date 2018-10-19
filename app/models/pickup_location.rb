class PickupLocation < ApplicationRecord
  belongs_to :location
  belongs_to :load

  validates_presence_of :appt_date

  default_scope { where(deleted_at: nil) }

  before_save :set_appt_date

  def set_appt_date
    appt_date || Date.today
  end
end
