class Admin::VendorsController < Admin::ApplicationController
  before_action :set_vendor, only: %i[show edit update destroy]

  def index
    @vendors = Vendor.all.order(:internal_name)
  end

  def new
    @vendor = Vendor.new
    @vendor.build_address
    @vendor.build_remit_address
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

  def edit
    @vendor.build_address unless @vendor.address
    @vendor.build_remit_address unless @vendor.remit_address
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to [:admin, @vendor], notice: "#{@vendor.vendor_type} updated."
    else
      render :new, error: 'Something went wrong, please try again.'
    end
  end

  def destroy
    @vendor.update(deleted_at: Time.now)
    redirect_to %i[admin vendors], notice: 'Vendor removed.'
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
      :email,
      :account_number,
      :website,
      :federal_id_number,
      :preferred_currency,
      :payment_terms,
      :required_1099,
      :phone,
      :toll_free,
      :fax,
      :remit_same_as_primary_address,
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
      :cargo_insurance_provider,
      :cargo_insurance_policy_number,
      :cargo_insurance_coverage,
      :cargo_insurance_start_date,
      :cargo_insurance_expiry_date,
      address_attributes: %i[
        address_line_1 address_line_2 city state_province
        country zipcode
      ],
      remit_address_attributes: %i[
        address_line_1 address_line_2 city state_province
        country zipcode
      ]
    )
  end
end
