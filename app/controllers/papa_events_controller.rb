class PapaEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :specified_papa_event, only: [:edit, :update, :destroy]
  before_action :specified_user, only: [:edit, :destroy]

  def show
    @papa_events = current_user.papa_events.where(papa_id: params[:papa_id]).order('created_at DESC')
  end

  def new
    @papa_event = current_user.papa_events.new
  end

  def create
    @papa_event = PapaEvent.new(papa_event_params)
    if @papa_event.save
      redirect_to papa_papa_event_path(current_user.papas.ids, current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @papa_event.update(papa_event_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @papa_event.destroy
      redirect_to papa_papa_event_path(current_user.papas.ids, current_user.id)
    else
      render :show
    end
  end

  private

  def papa_event_params
    params.require(:papa_event).permit(:started_at, :finished_at, :do_what_id, :todo, :place, :expected_reward, :reward, :status_id).merge(user_id: current_user.id, papa_id: params[:papa_id])
  end

  def specified_papa_event
    @papa_event = PapaEvent.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless current_user.id == @papa_event.user_id
  end
end
