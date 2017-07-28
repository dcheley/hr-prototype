class OpportunitiesController < ApplicationController
  before_action :load_opportunity, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def index
    @opportunities = Opportunity.all
    if current_user
      @badge = current_user.badges.build
    end
  end

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    @opportunity.creator_id = current_user.id
    if @opportunity.save
      redirect_to opportunities_url, notice: "#{@opportunity.name} successfully created"
    else
      render :new
    end
  end

  def show
    if current_user
      @badge = current_user.badges.build
    end
  end

  def edit
  end

  def update
    if @opportunity.update_attributes(opportunity_params)
      redirect_to opportunity_url, notice: "#{@opportunity.name} successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @opportunity.destroy
    redirect_to opportunities_url, notice: "#{@opportunity.name} successfully deleted!"
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
    params.require(:opportunity).permit(:name, :description, :avatar, :link,
    :creator_id, :learning, :career, :hobby, :skills, :image_delete, :second_link)
  end
end
