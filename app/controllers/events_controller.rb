# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events_grouped_by_year =
      Event.visible.includes(:commands).order(date: :desc).group_by { |event| event.date.year }
  end

  def show
    @event = Event.visible.find(params[:id])
  end
end
