class Admin::ViolationTicketsController < ApplicationController
  before_action :set_driver
  before_action :set_violation_ticket, only: [:show, :edit, :update]

  def new
    @violation_ticket = @driver.violation_tickets.new
  end

  def create
    @violation_ticket = @driver.violation_tickets.build(violation_ticket_params)
    if @violation_ticket.save
      redirect_to [:admin, @driver], notice: 'New violation ticket added'
    else
      render :new, error: 'Error occurred, please try again'
    end
  end

  def show; end

  def edit; end

  def update
    @violation_ticket.update(violation_ticket_params)
    redirect_to [:admin, @driver], notice: 'Violation ticket updated'
  end

  private

  def set_driver
    @driver = Driver.find(params[:driver_id])
  end

  def set_violation_ticket
    @violation_ticket = @driver.violation_tickets.find(params[:id])
  end

  def violation_ticket_params
    params.require(:violation_ticket).permit(
      :motor_vehicle_act_section,
      :description,
      :fine_amount,
      :points_deducted,
      :issue_date,
      :issue_place,
      :ticket
    )
  end
end
