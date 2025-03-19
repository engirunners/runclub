# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @athletes = Athlete.active.order(:last_name).includes(image_attachment: :blob)
    @results_count = Command.joins(:results).group(:athlete_id).distinct(:command_id).count
  end

  def show
    @athlete = Athlete.find_by!(nickname: params[:nickname])
    render :show_ex if @athlete.exit_date

    @command_results =
      Command.joins(:results)
        .eager_load(:event)
        .where(results: { athlete_id: @athlete.id }, events: { hidden: false })
        .order(date: :desc)
        .distinct
    @positions_count = @command_results.where(position: 1..3).unscope(:order).group(:position).count
  end
end
