class BadgesController < ApplicationController
  before_action :load_badge, only: [:edit, :update, :destroy]
  
  def new
    @badge = @user.badge.build
  end

  def create
    @badge = @user.build_badge(badge_params)

    if @badge.save
      redirect_to user_url(@user), notice: "#{@badge.name} created!"
    else
      render edit_badge_url, alert: "Failed to create badge."
    end
  end

  def update
    if @badge.update_attributes(badge_params)
      flash[:notice] = "Badge successfully updated!"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
  end

private

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:user_id, :name, :red, :blue, :yellow, :green, :grey, :purple, :pink)
  end
end
