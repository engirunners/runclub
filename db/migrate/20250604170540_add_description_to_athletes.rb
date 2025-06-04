# frozen_string_literal: true

class AddDescriptionToAthletes < ActiveRecord::Migration[7.2]
  def change
    add_column :athletes, :description, :text
  end
end
