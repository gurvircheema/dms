class Customer < ApplicationRecord
  include SoftDeletable
  has_one :address
  has_one :billing_address, foreign_key: :customer_id, class_name: 'Address'
  has_many :customer_locations
  has_many :locations, through: :customer_locations

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates :email, format: { with: Devise.email_regexp }

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :billing_address

  def primary_address
    address || Address.new
  end

  def secondary_address
    billing_address || Address.new
  end
end
