class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.signup == nil
      session[:user_id] = user.id
      redirect_to "/signups/step_one", notice: "Logged in"
    elsif user && user.authenticate(params[:password]) && user.signup != nil
      session[:user_id] = user.id
      redirect_to "/users/org_charts", notice: "Logged in"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
