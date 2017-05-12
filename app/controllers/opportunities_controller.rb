class OpportunitiesController < ApplicationController
  before_action :load_opportunity, only: [:show, :like, :unlike]

  def show
    if current_user
      @badge = current_user.badges.build
    end
  end

  def index
    @opportunities = Opportunity.all
  end

  def like
    @opportunity.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { @opportunity }
    end
  end

  def unlike
    @opportunity.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { @opportunity }
    end
  end

private
  def load_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:name, :description, :avatar)
  end
end
