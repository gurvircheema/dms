class Admin::LoadsController < Admin::ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]

  def index
    @loads = Load.includes(:customer, :vendor).all
    @loads_json = LoadSerializer.new(@loads).serialized_json
    authorize @loads
  end

  def new
    @load = Load.new
    @load.pickup_locations.build
    @load.drop_locations.build
    authorize @load
  end

  def create
    @load = Load.new(load_params)
    authorize @load
    if @load.save
      redirect_to [:admin, @load], notice: 'New load created'
    else
      render :new, error: 'Something went bed, please try again'
    end
  end

  def show
    authorize @load
  end

  def edit
    authorize @load
    @load.pickup_locations.build if @load.pickup_locations.empty?
    @load.drop_locations.build if @load.drop_locations.empty?
  end

  def update
    authorize @load
    if @load.update(load_params)
      redirect_to [:admin, @load], notice: 'Load updated'
    else
      render :new, error: 'Something went bed, please try again'
    end
  end

  def destroy
    authorize @load
    @load.update(deleted_at: Time.now, deleted_by: current_user)
    redirect_to [:admin, @load], notice: 'Load deleted'
  end

  private

  def set_load
    @load = Load.find(params[:id])
  end

  def load_params
    params.require(:load).permit(
      :customer_id,
      :customer_ref_number,
      :customer_rate,
      :currency,
      :equipment_type,
      :customer_notes,
      :vendor_cost,
      :vendor_id,
      :driver_id,
      :picked_up,
      :delivered,
      :invoiced,
      :payment_received,
      :paid_to_vendor,
      pickup_locations_attributes: [
        :location_id, :appt_date, :ref_number, :contact, :skids, :cases,
        :weight, :ltl, :commodity, :notes
      ],
      drop_locations_attributes: [
        :location_id, :appt_date, :ref_number, :contact, :skids, :cases,
        :weight, :ltl, :commodity, :notes
      ],
    )
  end
end
