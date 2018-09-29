class Company < ApplicationRecord
  validates_presence_of :name, :city, :province, :email, :is_customer, :is_carrier
  validates_uniqueness_of :name, :email
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
