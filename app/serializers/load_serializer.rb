class LoadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :customer_ref_number, :currency, :customer_notes,
             :equipment_type, :vendor_cost, :picked_up, :delivered,
             :invoiced, :payment_received, :paid_to_vendor, :deleted_by,
             :customer_id, :driver_id, :vendor_id, :created_at,
             :updated_at, :customer_rate, :deleted_at

  attribute :customer_name do |object|
    object.customer&.name
  end

  attribute :pickup_location do |object|
    object.pickup_locations&.first&.location&.address&.partial_address
  end

  attribute :dropoff_location do |object|
    object.drop_locations&.first&.location&.address&.partial_address
  end

  attribute :vendor_name do |object|
    object.vendor&.internal_name
  end

  attribute :driver_name do |object|
    object.driver&.name
  end
end
