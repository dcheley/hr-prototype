class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save && @signup.step_four == true
      redirect_to "/signups/step_five", notice: "Now create an Experience Badge"
    else
      render "signups/step_four"
    end
  end

  def update
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

  def signup_params
    params.require(:signup).permit(:user_id, :badge_id, :step_one, :step_two, :step_three, :step_four, :step_five, :step_six)
  end
end
