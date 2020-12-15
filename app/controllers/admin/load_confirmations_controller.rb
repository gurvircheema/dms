class Admin::LoadConfirmationsController < Admin::ApplicationController
  before_action :find_load

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "load_confirmation-#{@load.id}",
               layout: 'pdf.html.erb',
               show_as_html: params[:debug].present?
      end
    end
  end

  def email
    EmailWorker.perform_async(
      'carrier_confirmation',
      load_id: @load.id,
      email: email_params[:email]
    )
    redirect_to [:admin, @load], notice: 'Email Sent!'
  end

  private

  def find_load
    @load = Load.includes(:vendor, :driver,
                          pickup_locations: [location: :address],
                          drop_locations: [location: :address]).find(params[:id])
  end

  def email_params
    params.require(:load_confirmation).permit(:email)
  end
end
