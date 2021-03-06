class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render :json => { :errors => @user.errors.as_json }, :status => 420
      
    end  
  end

  def index
    @users = User.all
    render json: @users
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :newsletter_a, :newsletter_b, :newsletter_c, :newsletter_d, :sub_daily, :sub_weekly, :sub_monthly)
  end
end
