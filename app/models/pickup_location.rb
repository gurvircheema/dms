class PickupLocation < ApplicationRecord
  belongs_to :location
  belongs_to :load
end
