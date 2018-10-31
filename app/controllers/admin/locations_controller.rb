class Admin::LocationsController < Admin::ApplicationController
  before_action :set_location, only: [:show, :edit, :update]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @location.build_address
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to [:admin, @location], notice: 'New location added'
    else
      render :new, error: 'Something went wrong, please try again'
    end
  end

  def show
  end

  def edit
    @location.build_address unless @location.address
  end

  def update
    if @location.update(location_params)
      redirect_to [:admin, @location], notice: 'Location updated'
    else
      render :edit, error: 'Something went wrong, please try again!'
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(
      :name, :contact, :email, :phone, :toll_free, :fax,
      :loading_info, :receiving_info, :additional_info,
      address_attributes: [
        :address_line_1, :address_line_2, :city, :state_province,
        :country, :zipcode
      ]
   )
  end
end
