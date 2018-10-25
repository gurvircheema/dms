class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to [:admin, :users], notice: 'New user added.'
    else
      render :new, alert: 'Something went wrong, please try again'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, :users], notice: 'User updated'
    else
      render :edit, alert: 'Something went wrong, please try again'
    end
  end

  def destroy
    @user.destroy
    redirect_to [:admin, :users], notice: 'User deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end