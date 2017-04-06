class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.badges.ids == []
      session[:user_id] = user.id
      Badge.create(name: "Signed up",
        user_id: user.id,
        blue: true)
      redirect_to "/users/org_charts", notice: "Logged in! Thanks for signing up!"
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
