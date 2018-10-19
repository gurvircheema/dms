class Admin::DropLocationsController < Admin::ApplicationController
  before_action :set_load
  before_action :set_drop_location, only: [:destroy]

  def new
    @drop_location = @load.drop_locations.new
  end

  def create
    @drop_location = @load.drop_locations.build(drop_location_params)
    if @drop_location.save
      redirect_to [:admin, @load], notice: 'New pickup location added'
    else
      render :new, notice: 'Something went wrong, please try again'
    end
  end

  def destroy
    @drop_location.update(deleted_at: Time.now, deleted_by: current_user)
  end

  private

  def set_load
    @load = Load.find(params[:load_id])
  end

  def set_drop_location
    @drop_location = @load.drop_locations.find(params[:id])
  end

  def drop_location_params
    params.require(:drop_location).permit(
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
