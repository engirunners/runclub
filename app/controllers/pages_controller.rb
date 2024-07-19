# frozen_string_literal: true

class PagesController < ApplicationController
  def index; end

  def about
    @events_count = Event.count
    @commands_count = Command.count
    @position_counts = Command.where(position: 1..3).group(:position).count
  end
end
