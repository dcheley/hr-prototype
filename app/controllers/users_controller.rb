class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :load_users, only: [:index, :org_charts, :admo_org_chart, :bpf_org_chart, :hr_org_chart, :smf_org_chart]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to edit_user_url(@user), notice: "#{@user.email} account created! Please update your settings"
    else
      render :new
    end
  end

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("name ASC").distinct
    end
  end

  def org_charts
  end

  def opps
    @opportunities = Opportunity.all
    @opportunity_1 = Opportunity.find(1)
    @opportunity_2 = Opportunity.find(2)
    @opportunity_3 = Opportunity.find(3)
    @opportunity_4 = Opportunity.find(4)
    @opportunity_5 = Opportunity.find(5)
    @opportunity_6 = Opportunity.find(6)
    @opportunity_7 = Opportunity.find(7)
    @opportunity_8 = Opportunity.find(8)
    @opportunity_9 = Opportunity.find(9)
    @opportunity_10 = Opportunity.find(10)
    @opportunity_11 = Opportunity.find(11)
    @opportunity_12 = Opportunity.find(12)
    @opportunity_13 = Opportunity.find(13)
    @opportunity_14 = Opportunity.find(14)
    @opportunity_15 = Opportunity.find(15)
    @opportunity_16 = Opportunity.find(16)
    if current_user
      @badge = current_user.badges.build
    end
  end

  def admo_org_chart
  end

  def bpf_org_chart
  end

  def hr_org_chart
  end

  def smf_org_chart
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params) && @user.signup.step_six == true
      flash[:alert] = "Account Sign Up complete!"
      redirect_to user_url
    # elsif @user.update_attributes(user_params) && @user.signup.step_one == true
    #   redirect_to "/signups/step_two", notice: "Start setting up your account details below"
    elsif @user.update_attributes(user_params) && @user.signup.step_two == true && @user.signup.step_three != true
      redirect_to "/signups/step_three", notice: "Describe your Career Aspirations and Job Responsibilities below"
    elsif @user.update_attributes(user_params) && @user.signup.step_three == true && @user.signup.step_four != true
      redirect_to "/signups/step_four", notice: "Choose or Create your Education Badges below"
    elsif @user.update_attributes(user_params) && @user.signup.step_four == true && @user.signup.step_five != true
      redirect_to "/signups/step_five", notice: "Choose or Create your Experience Badges below"
    elsif @user.update_attributes(user_params) && @user.signup.step_five == true && @user.signup.step_six != true
      redirect_to "/signups/step_six", notice: "Verify your Sign Up below to start using the App"
    else
      render :edit
    end
  end

private
  def load_user
    @user = User.find(params[:id])
  end

  def load_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone,
    :title, :avatar, :job_description, :adm, :director, :manager, :staff, :adm_office,
    :strategic_human_resources, :service_management_and_facilities, :business_planning_and_finance,
    :co_op, :image_delete, :career_aspirations, :direct_report, :agreement, :intranet,
    signup_attributes: [:id, :user_id, :step_one, :step_two, :step_three, :step_six])
  end
end
