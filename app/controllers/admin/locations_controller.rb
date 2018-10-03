class Admin::LocationsController < ApplicationController
  before_action :set_company
  before_action :set_location, only: [:show, :edit, :update]

  def new
    @location = @company.locations.new
  end

  def create
    @location = @company.locations.build(location_params)
    if @location.save
      redirect_to [:admin, @company], notice: 'New location added'
    else
      render :new, error: 'Something went wrong, please try again'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to [:admin, @company, @location], notice: 'Location updated'
    else
      render :edit, error: 'Something went wrong, please try again!'
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_location
    @location = @company.locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :city, :province,
                                     :country, :zip, :contact, :email, :phone,
                                     :toll_free, :fax, :loading_info,
                                     :receiving_info, :additional_info
                                    )
  end
end
