# frozen_string_literal: true

class AddFractionalSecondToResults < ActiveRecord::Migration[7.1]
  def change
    add_column :commands, :fractional_second, :integer
    add_column :results, :fractional_second, :integer
  end
end
