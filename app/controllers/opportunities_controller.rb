class OpportunitiesController < ApplicationController
  before_action :load_opportunity [:show, :like, :unlike]

  def show
    @badge = current_user.badges.build
  end

  def index
    @opportunities = Opportunity.all
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
  def load_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:name, :description, :avatar)
  end
end
