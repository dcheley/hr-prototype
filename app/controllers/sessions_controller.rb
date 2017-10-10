class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && Argon2::Password.verify_password("#{params[:password]}", user.encrypted_password) == true && user.agreement != true
      session[:user_id] = user.id
      redirect_to "/signups/new", notice: "Agree to terms to begin sign up"
    elsif user && Argon2::Password.verify_password("#{params[:password]}", user.encrypted_password) == false && user.agreement == true
      session[:user_id] = user.id
      redirect_to "/users/home"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
