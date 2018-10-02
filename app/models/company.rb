class Company < ApplicationRecord
  validates_presence_of :name, :city, :province, :email
  validates_inclusion_of :is_customer, :is_carrier, in: [true, false]
  validates_uniqueness_of :name, :email
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
