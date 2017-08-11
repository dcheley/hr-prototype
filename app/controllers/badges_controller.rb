class BadgesController < ApplicationController
  before_action :load_badge, only: [:edit, :update, :destroy, :like, :unlike]
  before_action :load_user, only: [:new, :edit, :update, :destroy]

  def new
    @badge = Badge.new
  end

  def exp
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    # Use current_user when signing up for an opportunity (No implicit @user in this case)
    if params[:user_id] != nil
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    @badge.user_id = @user.id

    if @badge.save && @badge.opportunity_id == nil && @badge.signup == nil
      redirect_to user_url(@user), notice: "#{@badge.name} badge created!"
    elsif @badge.save && @badge.opportunity_id == nil && @badge.signup.step_four == true
      redirect_to "/signups/step_five", notice: "#{@badge.name} badge added to profile! Now add an experience badge"
    elsif @badge.save && @badge.opportunity_id == nil && @badge.signup.step_five == true
      redirect_to "/signups/step_six", notice: "#{@badge.name} badge added to profile! Verify your Sign Up below to start using the App"
    elsif @badge.save && @badge.opportunity_id != nil
      redirect_to user_url(@user), notice: "Successfully signed up for #{@badge.name}!"
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup == nil && @badge.education == true
      render :new
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup == nil && @badge.exp == true
      render :exp
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup.step_four == true
      render 'signups/step_four'
    elsif @badge.save == false && @badge.opportunity_id == nil && @badge.signup.step_five == true
      render 'signups/step_five'
    else
      render 'users/home', notice: "Uh oh! Something unexpected occurred"
    end
  end

  def update
    if @badge.update_attributes(badge_params)
      flash[:notice] = "#{@badge.name} badge successfully updated!"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @badge.destroy
    redirect_to user_url(@user), notice: "#{@badge.name} badge successfully deleted!"
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
