class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/pages/intro", notice: "#{@user.email} account created!"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def admo_org_chart
    @users = User.all
  end

  def bpf_org_chart
    @users = User.all
  end

  def hr_org_chart
    @users = User.all
  end

  def smf_org_chart
    @users = User.all
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

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :phone, :title, :feedback, :adm, :director, :manager, :adm_office, :strategic_human_resources, :service_management_and_facilities, :business_planning_and_finance)
  end
end
