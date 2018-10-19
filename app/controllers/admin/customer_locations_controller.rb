class Admin::CustomerLocationsController < Admin::ApplicationController
  before_action :set_customer

  def new
    @customer_location = @customer.customer_locations.new
  end

  def create
    @customer_location = @customer.customer_locations.new(customer_location_params)
    if @customer_location.save
      redirect_to [:admin, @customer]
    else
      render :new, error: 'Something went wrong, Please try again'
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def customer_location_params
    params.require(:customer_location).permit(:location_id)
  end
end