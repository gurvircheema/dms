class AddressSerializer < ActiveModel::Serializer
  attributes :id, :address_line_1, :address_line_2, :city,
             :state_province, :country, :zipcode
end
