class Customer < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates :email, format: { with: Devise.email_regexp }

  has_many :locations
  has_one :address
  has_one :billing_address, foreign_key: :customer_id, class_name: 'Address'

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :billing_address
end
