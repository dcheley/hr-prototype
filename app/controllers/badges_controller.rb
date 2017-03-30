class BadgesController < ApplicationController
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
