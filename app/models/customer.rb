class Customer < ApplicationRecord
  validates_presence_of :name, :city, :province, :email
  validates_uniqueness_of :name, :email
  validates :email, format: { with: Devise.email_regexp }

  has_many :locations
end
