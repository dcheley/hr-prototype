class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

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

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:alert] = "Settings successfully updated!"
      redirect_to user_url
    else
      render :edit
    end
  end

private
  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
