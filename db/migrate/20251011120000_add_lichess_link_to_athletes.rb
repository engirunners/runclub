# frozen_string_literal: true

class AddLichessLinkToAthletes < ActiveRecord::Migration[7.2]
  def change
    add_column :athletes, :lichess_link, :string
  end
end
