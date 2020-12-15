class Admin::LicensesController < ApplicationController
  before_action :set_driver
  before_action :set_license, only: %i[show edit update]
  def new
    @license = @driver.licenses.new
  end

  def create
    @license = @driver.licenses.build(license_params)
    if @license.save
      redirect_to [:admin, @driver], notice: 'New license record added'
    else
      render :new, error: 'Something went wrong, please try again'
    end
  end

  def show; end

  def edit; end

  def update
    @license.update(license_params)
    redirect_to [:admin, @driver], notice: 'license record updated'
  end

  private

  def set_driver
    @driver = Driver.find(params[:driver_id])
  end

  def set_license
    @license = @driver.licenses.find(params[:id])
  end

  def license_params
    params.require(:license).permit(
      :number, :issue_date, :expiry_date, :restrictions, :province
    )
  end
end
