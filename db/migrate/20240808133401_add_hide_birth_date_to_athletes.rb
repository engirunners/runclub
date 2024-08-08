# frozen_string_literal: true

class AddHideBirthDateToAthletes < ActiveRecord::Migration[7.1]
  def change
    add_column :athletes, :hide_birth_date, :boolean, default: false, null: false
  end
end
