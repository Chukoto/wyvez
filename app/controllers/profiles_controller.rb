class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :specified_profile, only: [:show, :edit, :update]
  before_action :specified_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:trans_exp_id, :papa_exp_id, :text, :image).merge(user_id: current_user.id)
  end

  def specified_profile
    @profile = Profile.find_by(user_id: params[:id])
  end

  def specified_user
    redirect_to root_path unless current_user.id == @profile.user_id
  end
end
