class PulseSurveysController < ApplicationController
  def edit
    @pulse_survey = PulseSurvey.find(current_user.id)
  end

  def update
    @pulse_survey = PulseSurvey.find(current_user.id)
    if @pulse_survey.update_attributes(pulse_survey_params)
      session[:user_id] = nil
      redirect_to root_url, notice: "Survey Complete, Logged out"
    else
      render :edit
    end
  end

private
  def pulse_survey_params
    params.require(:pulse_survey).permit(:feedback)
  end
end
