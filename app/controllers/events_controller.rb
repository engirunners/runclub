# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events_grouped_by_year = Event.order(date: :desc).group_by { |event| event.date.year }
  end

  def show
    @event = Event.find(params[:id])
  end
end
