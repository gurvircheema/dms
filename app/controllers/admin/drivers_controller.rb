class Admin::DriversController < Admin::ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  def index
    @drivers = Driver.all
  end

  def show
    @violation_tickets = @driver.violation_tickets
  end

  def edit; end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save!
      redirect_to [:admin, :drivers], notice: 'New driver has been added'
    else
      render :new, error: 'There was an error, please try again'
    end
  end

  def update
    if @driver.update(driver_params)
      redirect_to [:admin, :drivers], notice: 'Driver updated'
    else
      render :edit, error: 'There was an error, please try again'
    end
  end

  def destroy
    @driver.update_column(:active, false)
    redirect_to [:admin, :drivers], notice: 'Driver marked deleted'
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name, :address, :city, :state, :country,
                                   :zip, :phone, :cell, :email, :active,
                                   :driver_type, :ability_to_work,
                                   :date_of_birth)
  end
end
