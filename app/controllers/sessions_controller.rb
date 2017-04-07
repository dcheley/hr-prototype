class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.badges.ids == []
      session[:user_id] = user.id
      #Badge.create(name: "Sign Up",
      #   user_id: user.id,
      #   blue: true)
      redirect_to "/users/#{user.id}", notice: "To get started, scroll down and add badges that depict your current skills and experience."
    elsif user && user.authenticate(params[:password]) && user.badges.ids != []
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
