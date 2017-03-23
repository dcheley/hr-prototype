class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :load_users, only: [:index, :admo_org_chart, :bpf_org_chart, :hr_org_chart, :smf_org_chart]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/pages/org_charts", notice: "#{@user.email} account created!"
    else
      render :new
    end
  end

  def index
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
    if @user.update_attributes(user_params)
      flash[:alert] = "Settings successfully updated!"
      redirect_to user_url
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :title, :feedback, :adm, :director, :manager, :staff, :adm_office, :strategic_human_resources, :service_management_and_facilities, :business_planning_and_finance)
  end
end
