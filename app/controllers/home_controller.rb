class HomeController < ApplicationController
  def index
    @events = Event.all
    @events = @events.where('title LIKE ?', "%#{params[:find_event]}%") if params[:find_event].present?

    if params[:subject_id].present?
      @subject = Subject.find(params[:subject_id])
      @events = @subject.events
    end

    @subjects = Subject.all

    @events.each do |event|
      event.update_status_if_expired
    end
  end

  def show
    @event = Event.find(params[:id])
    @event.update_status_if_expired
  end

  def select_by_subject
    @subject = Subject.find(params[:id])
    @events = @subject.events
    @subjects = Subject.all
    @events.each do |event|
      event.update_status_if_expired
    end
    render 'index'
  end
end
