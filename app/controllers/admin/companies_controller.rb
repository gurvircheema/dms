class Admin::CompaniesController < Admin::ApplicationController
  before_action :find_company

  def show
    authorize @company
  end

  def edit
    authorize @company
  end

  def update
    authorize @company
    @company.update!(company_params)
    redirect_to [:admin, @company], notice: 'Company updated'
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name,
      :contact,
      :starting_date,
      :phone,
      :fax,
      :email,
      :website,
      :hst_num,
      :hst_percentage,
      :pst_num,
      :pst_percentage,
      :gst_num,
      :gst_percentage,
      :factory_company,
      :us_dot,
      :mc_num,
      :cvor_num,
      :currency,
      :state,
      :scac_code,
      :carrier_code,
      :last_invoice,
      :terms_for_customer_invoice,
      :terms_conditions_for_carrier,
      :notes_for_bol,
      :notes_for_factor_invoice,
      :notes_on_reminder_letter
    )
  end
end
