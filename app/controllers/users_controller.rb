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

  def home
    @received_badges = Recognition.where.not(receiver_id: nil).order("created_at DESC")
    @opportunity_badges = Badge.where.not(opportunity_id: nil).order("created_at DESC")
    @edu_badges = Badge.where(opportunity_id: nil, education: true).order("created_at DESC")
    @exp_badges = Badge.where(opportunity_id: nil, exp: true).order("created_at DESC")
  end

  def org_charts
  end

  def opps
    @opportunities = Opportunity.all
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
    if @user.update_attributes(user_params) && @user.agreement == true && PulseSurvey.exists?(@user.id) == false
      flash[:alert] = "Account Sign Up complete"
      PulseSurvey.create(id: current_user.id)
      redirect_to user_url
    elsif @user.update_attributes(user_params) && @user.agreement == true && PulseSurvey.exists?(@user.id) == true
      redirect_to user_url, notice: "Account Settings Updated"
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
    signup_attributes: [:id, :user_id, :step_one, :step_two, :step_three, :step_four, :step_five, :step_six])
  end

  def reset_time
    @reset_time = Date.new(2017, 6, 5)
  end
end
