class Admin::CompaniesController < Admin::ApplicationController
  before_action :set_company, only: [:show, :edit, :update]

  def index
    @companies = Company.all.order(:name)
  end

  def show; end

  def edit; end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to [:admin, @company], notice: 'New company added'
    else
      render :new, error: 'Error occurred, please try again'
    end
  end

  def update
    if @company.update(company_params)
      redirect_to [:admin, @company], notice: 'Company info updated'
    else
      render :edit, error: 'Error occurred, please try again'
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name,
      :address,
      :city,
      :province,
      :zip,
      :country,
      :billing_address,
      :billing_city,
      :billing_province,
      :billing_zip,
      :billing_country,
      :phone,
      :toll_free,
      :fax,
      :email,
      :customer,
      :carrier
     )
  end
end
