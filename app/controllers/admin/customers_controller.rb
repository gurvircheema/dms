class Admin::CustomersController < Admin::ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all.order(:name)
  end

  def show; end

  def edit; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to [:admin, @customer], notice: 'New customer added'
    else
      render :new, error: 'Error occurred, please try again'
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to [:admin, @customer], notice: 'customer info updated'
    else
      render :edit, error: 'Error occurred, please try again'
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
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
      :email
     )
  end
end
