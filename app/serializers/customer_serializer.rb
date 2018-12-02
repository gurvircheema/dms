class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :toll_free, :fax
  has_one :address
  has_one :billing_address, foreign_key: :customer_id, class_name: 'Address'

  private

  def attributes
    hash = super
    hash.merge!(country_list: Country.list, state_list: State.list)
    hash
  end
end
