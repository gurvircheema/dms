class Admin::VendorsController < Admin::ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all.order(:internal_name)
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to [:admin, @vendor], notice: "New #{@vendor.vendor_type} added."
    else
      render :new, error: 'Something went wrong, please try again.'
    end
  end

  def show; end

  def edit; end

  def update
    if @vendor.update(vendor_params)
      redirect_to [:admin, @vendor], notice: "#{@vendor.vendor_type} updated."
    else
      render :new, error: 'Something went wrong, please try again.'
    end
  end

  def destroy
    @vendor.update(deleted_at: Time.now)
    redirect_to [:admin, :vendors], notice: "Vendor removed."
  end

  private

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(
      :internal_name,
      :legal_name,
      :remit_name,
      :account_number,
      :website,
      :federal_id_number,
      :preferred_currency,
      :payment_terms,
      :required_1099,
      :address,
      :city,
      :state_province,
      :country,
      :zip,
      :phone,
      :toll_free,
      :fax,
      :remit_same_as_primary_address,
      :remit_address,
      :remit_city,
      :remit_state_province,
      :remit_country,
      :remit_zip,
      :remit_phone,
      :remit_toll_free,
      :remit_fax,
      :vendor_type,
      :rating,
      :contract_on_file,
      :docker_number,
      :dot_number,
      :wcb_number,
      :ca_bond_number,
      :us_bond_number,
      :scac,
      :csa_approved,
      :hazmat,
      :hazmat_expiry_date,
      :smc3_tariff_code,
      :approved,
      :liability_insurance_provider,
      :liability_policy_number,
      :liability_coverage,
      :liability_insurance_start_date,
      :liability_insurance_expiry_date,
      :cargo_insurnace_provider,
      :cargo_insurance_policy_number,
      :cargo_insurance_coverage,
      :cargo_insurance_start_date,
      :cargo_insurance_expiry_date,
    )
  end
end
