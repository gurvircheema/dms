class Admin::PickupLocationsController < Admin::ApplicationController
  before_action :set_load
  before_action :set_pickup_location, only: [:destroy]

  def new
    @pickup_location = @load.pickup_locations.new
  end

  def create
    @pickup_location = @load.pickup_locations.build(pickup_location_params)
    if @pickup_location.save
      redirect_to [:admin, @load], notice: 'New pickup location added'
    else
      render :new, notice: 'Something went wrong, please try again'
    end
  end

  def destroy
    @pickup_location.update(deleted_at: Time.now, deleted_by: current_user)
  end

  private 

  def set_load
    @load = Load.find(params[:load_id])
  end

  def set_pickup_location
    @pickup_location = @load.pickup_locations.find(params[:id])
  end

  def pickup_location_params
    params.require(:pickup_location).permit(
      :appt_date,
      :ref_number,
      :contact,
      :skids,
      :cases,
      :weight,
      :ltl,
      :commodity,
      :notes,
      :location_id
    )
  end
end