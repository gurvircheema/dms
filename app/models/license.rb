class License < ApplicationRecord
  belongs_to :driver
  validates_presence_of :number, :issue_date, :expiry_date
end
