class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to %i[admin users], notice: 'New user added.'
    else
      render :new, alert: 'Something went wrong, please try again'
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to %i[admin users], notice: 'User updated'
    else
      render :edit, alert: 'Something went wrong, please try again'
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to %i[admin users], notice: 'User deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
