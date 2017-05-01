class RecognitionsController < ApplicationController
  before_action :load_recognition, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :load_user, only: [:new, :create, :show, :edit, :update, :destroy]

  def new
    @recognition = Recognition.new
  end

  def create
    @recognition = Recognition.new(recognition_params)

    if @recognition.save
      redirect_to "/users/#{@user.id}/recognitions/#{@recognition.id}", notice: "#{@recognition.name} badge given!"
    else
      render :new
    end
  end

  def show
  end

  def update
    if @recognition.update_attributes(recognition_params)
      flash[:notice] = "#{@recognition.name} badge successfully updated!"
      redirect_to recognition_url(@recognition)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @recognition.destroy
    flash[:notice] = "#{@recognition.name} badge successfully deleted!"
    redirect_to user_url(@user)
  end

  def like
    @recognition.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { @recognition }
    end
  end

  def unlike
    @recognition.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { @recognition }
    end
  end

private
  def load_user
    @user = User.find(params[:user_id])
  end

  def load_recognition
    @recognition = Recognition.find(params[:id])
  end

  def recognition_params
    params.require(:recognition).permit(:name, :description, :receiver_id, :recognizer_id)
  end
end
