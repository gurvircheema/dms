class DropLocation < ApplicationRecord
  belongs_to :location
  belongs_to :load
end
