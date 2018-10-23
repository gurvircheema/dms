ActiveRecord::Base.transaction do
  Address.create!(
    address_line_1: ENV['address_address_line_1'],
    city: ENV['address_city'],
    state_province: ENV['address_state_province'],
    country: ENV['address_country'],
    zipcode: ENV['address_zipcode'],
  )

  Company.create!(
    name: ENV['company_name'],
    address_id: Address.last.id,
    contact: ENV['company_contact'],
    phone: ENV['company_phone'],
    starting_date: Date.new(2011, 6, 1),
    fax: ENV['company_fax'],
    email: ENV['company_email'],
    website: ENV['company_website'],
    state: ENV['company_state'],
    currency: ENV['company_currency'],
    last_invoice: ENV['company_last_invoice'],
  )
  byebug
  false
end