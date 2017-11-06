class SignupsController < ApplicationController
  before_action :load_user_and_signup, only: [:step_two, :step_three, :step_four, :step_five, :step_six]

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    @signup.current_step = 2
    if @signup.save
      redirect_to "/signups/step_two", notice: "Start setting up your account details below"
    else
      render :new
    end
  end

  def update
    @signup = Signup.find_by(user_id: current_user.id)
  end

  def step_two
  end

  def step_three
  end

  def step_four
    @badge = Badge.new
  end

  def step_five
    @badge = Badge.new
  end

  def step_six
  end

private
  def load_user_and_signup
    @user = current_user
    @signup = @user.signup
  end

  def signup_params
    params.require(:signup).permit(:user_id, :badge_id, :current_step)
  end
end
