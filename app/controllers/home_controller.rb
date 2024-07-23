class HomeController < ApplicationController
  # before_action :check_admin, only: [:manager]
  # def index
  #   @events = Event.all
  #   @events = @events.where('title LIKE ?', "%#{params[:find_event]}%") if params[:find_event].present?
  #   if params[:subject_id].present?
  #     @subject = Subject.find(params[:subject_id])
  #     @events = @subject.events
  #   end
  #   @subjects = Subject.all
  #   @events = @events.order(created_at: :desc) if params[:sort] == 'newest'
  #   @events = @events.order(created_at: :asc) if params[:sort] == 'oldest'

  #   #update status cua event theo thoi gian
  #   @events.each do |event|
  #     event.update_status_if_expired
  #   end
  # end

  def index
    @subjects = Subject.all
    @events = Event.all

    if params[:subject_id].present?
      @events = @events.where(subject_id: params[:subject_id])
    end

    if params[:find_event].present?
      @events = @events.where('title LIKE ?', "%#{params[:find_event]}%")
    end

    if params[:sort].present?
      @events = @events.order(created_at: params[:sort] == 'newest' ? :desc : :asc)
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
