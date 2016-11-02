class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show; end

  def edit; end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: t('events.create.success')
    else
      render :new
    end
  end

  def update
    if @event.update(account_params)
      redirect_to events_path, notice: t('events.update.success')
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t('events.delete.success')
  end

  private


  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end
end
