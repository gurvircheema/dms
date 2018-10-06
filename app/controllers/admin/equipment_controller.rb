class Admin::EquipmentController < Admin::ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update]

  def index
    @equipment = Equipment.all
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.driver = Driver.find(params[:equipment][:driver]) if params.dig(:equipment, :driver).present?
    if @equipment.save
      redirect_to [:admin, @equipment], notice: 'New Equipment Added'
    else
      render :new, error: 'Something went wrong, please try again!'
    end
  end

  def edit
  end

  def update
    @equipment.driver = Driver.find(params[:equipment][:driver]) if params.dig(:equipment, :driver).present?
    if @equipment.update(equipment_params)
      redirect_to [:admin, @equipment], notice: 'Equipment updated'
    else
      render :edit, error: 'Something went wrong, Please try again!'
    end
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(
      :unit_number,
      :unit_type,
      :owned_by_company,
      :active_date,
      :inactive_date,
      :license_plate,
      :license_plate_state,
      :vin,
      :certification_registration_number,
      :certification_registration_expiry,
      :safety_inspection_number,
      :safety_inspection_expiry,
      :insurance_provider,
      :insurance_policy_number,
      :insurance_policy_expiry,
      :ifta_decal_number,
      :ifta_decal_expiry,
      :make,
      :model,
      :year,
      :fuel_type,
      :number_of_axles,
      :gross_weight_lbs,
      :body_color,
      :leased_vehicle,
      :lease_company,
      :lease_end_date,
      :lease_monthly_rate,
      :lease_buyout_cost,
      :driver_id
    )
  end
end
