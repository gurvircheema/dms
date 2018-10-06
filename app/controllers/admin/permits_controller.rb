class Admin::PermitsController < Admin::ApplicationController
  before_action :set_equipment
  before_action :set_permit, only: [:edit, :update, :destroy]

  def new
    @permit = @equipment.permits.new
  end

  def create
    @permit = @equipment.permits.build(permit_params)
    if @permit.save
      redirect_to [:admin, @equipment], notice: 'New permit added'
    else
      render :new, error: 'Something went wrong, please try again'
    end
  end

  def edit
  end

  def update
    if @permit.update(permit_params)
      redirect_to [:admin, @equipment], notice: 'Permit updated'
    else
      render :edit, error: 'Something went wrong, please try again'
    end
  end

  def destroy
    @permit.update(deleted_at: Time.now)
    redirect_to [:admin, @equipment], notice: 'Permit Deleted'
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def set_permit
    @permit = @equipment.permits.find(params[:id])
  end

  def permit_params
    params.require(:permit).permit(
      :permit_type,
      :permit_number,
      :state_province,
      :expiry_date,
      :reminder
    )
  end
end
