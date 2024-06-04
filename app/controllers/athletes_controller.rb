# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @athletes = Athlete.active.order(:last_name)
  end

  def show
    @athlete = Athlete.find(params[:id])
  end
end
