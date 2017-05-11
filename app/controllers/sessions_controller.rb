class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.agreement != true
      session[:user_id] = user.id
      redirect_to "/pages/disclaimer", notice: "Welcome! Read the disclaimer below before creating your account"
    elsif user && user.authenticate(params[:password]) && user.agreement == true
      session[:user_id] = user.id
      redirect_to "/users/org_charts", notice: "Logged in!"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
