class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors
    end  
  end

  def index
    @users = User.all
    render json: @users
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :newsletter_a, :newsletter_b, :newsletter_c, :newsletter_d, :sub_daily, :sub_weekly, :sub_monthly)
  end
end