# frozen_string_literal: true

class AddStravaLinkToAthletes < ActiveRecord::Migration[7.1]
  def change
    add_column :athletes, :strava_link, :string
  end
end
