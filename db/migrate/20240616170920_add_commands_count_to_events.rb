# frozen_string_literal: true

class AddCommandsCountToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :commands_count, :integer
    add_column :commands, :results_count, :integer
  end
end
