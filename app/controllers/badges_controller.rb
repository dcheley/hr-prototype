class BadgesController < ApplicationController
  before_action :load_badge, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :load_user, only: [:new, :show, :edit, :update, :destroy]

  def new
    @badge = Badge.new
  end

  def exp
    @badge = Badge.new
  end

  def create
    @users = User.all
    @badge = Badge.new(badge_params)
    if params[:user_id] != nil
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    if current_user != @user
      @badge.user_id = @user.id
    else
      @badge.user_id = current_user.id
    end

    if @badge.save && @badge.opportunity_id == nil && @badge.signup == nil
      redirect_to "/users/#{current_user.id}/badges/#{@badge.id}", notice: "#{@badge.name} badge created!"
    elsif @badge.save && @badge.opportunity_id == nil && @badge.signup.step_four == true
      redirect_to "/signups/step_five", notice: "#{@badge.name} badge added to profile! Now add an experience badge"
    elsif @badge.save && @badge.opportunity_id == nil && @badge.signup.step_five == true
      redirect_to "/signups/step_six", notice: "#{@badge.name} badge added to profile! Verify your Sign Up below to start using the App"
    elsif @badge.save && @badge.opportunity_id != nil
      redirect_to "/users/#{current_user.id}/badges/#{@badge.id}", notice: "Successfully signed up for #{@badge.name}!"
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup == nil
      render :new
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup.step_four == true
      render 'signups/step_four'
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup.step_five == true
      render 'signups/step_five'
    else
      render 'users/org_charts'
    end
  end

  def show
  end

  def update
    # add step 6 here
    if @badge.update_attributes(badge_params)
      flash[:notice] = "#{@badge.name} badge successfully updated!"
      redirect_to "/users/#{@user.id}/badges/#{@badge.id}"
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @badge.destroy
    flash[:notice] = "#{@badge.name} badge successfully deleted!"
    redirect_to user_url(@user)
  end

  def like
    @badge.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { @badge }
    end
  end

  def unlike
    @badge.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { @badge }
    end
  end

private
  def load_user
    @user = User.find(params[:user_id])
  end

  def load_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:user_id, :opportunity_id, :name, :red, :blue,
    :yellow, :green, :grey, :purple, :pink, :description, :exp, :education,
    signup_attributes: [:step_four, :step_five])
  end
end
