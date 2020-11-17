class BeautyEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :specified_beauty_event, only: [:edit, :update, :destroy]
  before_action :specified_user, only: [:edit, :destroy]

  def show
    @beauty_events = current_user.beauty_events.order('created_at DESC')
  end

  def new
    @beauty_event = BeautyEvent.new
  end

  def create
    @beauty_event = BeautyEvent.new(beauty_event_params)
    if @beauty_event.save
      redirect_to beauty_event_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @beauty_event.update(beauty_event_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @beauty_event.destroy
      redirect_to beauty_event_path(current_user.id)
    else
      render :show
    end
  end

  private

  def beauty_event_params
    params.require(:beauty_event).permit(:beauty_cate_id, :started_at, :place, :memo, :cost, :status_id).merge(user_id: current_user.id)
  end

  def specified_beauty_event
    @beauty_event = BeautyEvent.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless current_user.id == @beauty_event.user_id
  end
end
