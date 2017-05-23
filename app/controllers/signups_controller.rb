class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    if @signup.save && @signup.step_one == true
      redirect_to "/signups/step_two", notice: "Start setting up your account details below"
    else
      render :edit
    end
  end

  def update

  end

  def step_two
  end

  def step_three
  end

  def step_four
  end

  def step_five
  end

  def step_six
  end

private

  def signup_params
    params.require(:signup).permit(:user_id, :step_one, :step_two, :step_three, :step_four, :step_five, :step_six)
  end
end
