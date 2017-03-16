class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to "/msg", notice: "#{@user.email} account created!"
    else
      render :new, alert: "Error occurred during sign up, please try again."
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
