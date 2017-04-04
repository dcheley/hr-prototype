class BadgesController < ApplicationController
  before_action :load_badge, only: [:show, :edit, :update, :destroy]
  before_action :load_user, only: [:new, :create, :show, :edit, :update, :destroy]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.user_id = @user.id
    if @badge.save
      redirect_to user_url(@user), notice: "#{@badge.name} created! Scroll down to create more badges."
    else
      render :new
    end
  end

  def show
  end

  def update
    if @badge.update_attributes(badge_params)
      flash[:notice] = "#{@badge.name} successfully updated!"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @badge.destroy
    flash[:notice] = "#{@badge.name} successfully deleted!"
    redirect_to user_url(@user)
  end

private
  def load_user
    @user = User.find(params[:user_id])
  end

  def load_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:user_id, :opportunity_id, :name, :red, :blue, :yellow, :green, :grey, :purple, :pink, :description)
  end
end
