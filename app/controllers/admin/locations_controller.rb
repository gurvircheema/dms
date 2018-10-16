class Admin::LocationsController < ApplicationController
  before_action :set_customer
  before_action :set_location, only: [:show, :edit, :update]

  def new
    @location = @customer.locations.new
    @location.build_address
  end

  def create
    @location = @customer.locations.build(location_params)
    if @location.save
      redirect_to [:admin, @customer], notice: 'New location added'
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
      redirect_to [:admin, @customer, @location], notice: 'Location updated'
    else
      render :edit, error: 'Something went wrong, please try again!'
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_location
    @location = @customer.locations.find(params[:id])
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
