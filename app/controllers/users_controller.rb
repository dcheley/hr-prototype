class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/pages/intro", notice: "#{@user.email} account created!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
