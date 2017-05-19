class SignupsController < ApplicationController
  def step_one
    @signup = Signup.create(
      user_id: current_user.id,
    )
    if @signup.update_attributes(signup_params)
      redirect_to "signups/step_two", notice: "Start setting up your account details below"
    end
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
