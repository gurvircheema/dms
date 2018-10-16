class Admin::CustomersController < Admin::ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all.order(:name)
  end

  def show
    @address = @customer.primary_address
    @billing_address = @customer.secondary_address
  end

  def edit
    @customer.build_address unless @customer.address
    @customer.build_billing_address unless @customer.billing_address
  end

  def new
    @customer = Customer.new
    @customer.build_address
    @customer.build_billing_address
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
      :phone,
      :toll_free,
      :fax,
      :email,
      address_attributes: [
        :address_line_1, :address_line_2, :city,
        :state_province, :country, :zipcode
      ],
      billing_address_attributes: [
        :address_line_1, :address_line_2, :city,
        :state_province, :country, :zipcode
      ]
     )
  end
end
