class PickupLocation < ApplicationRecord
  include SoftDeletable
  belongs_to :location
  belongs_to :load

  validates_presence_of :appt_date

  before_save :set_appt_date

  def set_appt_date
    appt_date || Date.today
  end
end
