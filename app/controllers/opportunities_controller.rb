class OpportunitiesController < ApplicationController

  def show
    @opportunity = Opportunity.find(params[:id])
    @badge = current_user.badges.build
  end

  def index
    @opportunities = Opportunity.all
  end

private
  def opportunity_params
    params.require(:opportunity).permit(:name, :description, :avatar)
  end
end
