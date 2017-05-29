class PulseSurveysController < ApplicationController
  def new
    @pulse_survey = PulseSurvey.new
  end

  def create
    @pulse_survey = PulseSurvey.new(pulse_survey_params)
    if @pulse_survey.save
      session[:user_id] = nil
      redirect_to root_url, notice: "Survey Complete, Logged out"
    else
      render :new
    end
  end

private
  def pulse_survey_params
    params.require(:pulse_survey).permit(:feedback)
  end
end
