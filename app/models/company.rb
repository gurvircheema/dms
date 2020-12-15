class Company < ApplicationRecord
  belongs_to :address

  validates_presence_of :name, :contact, :phone, :fax, :email, :website,
                        :state, :currency, :last_invoice
  validates_inclusion_of :currency, in: Currency.list
  validates_inclusion_of :state, in: State.list
end
