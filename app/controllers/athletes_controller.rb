# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @athletes = Athlete.active.order(:last_name).includes(image_attachment: :blob)
    @results_count = Command.joins(:results).group(:athlete_id).distinct(:command_id).count
  end

  def show
    @athlete = Athlete.find_by!(nickname: params[:nickname])
  end
end
