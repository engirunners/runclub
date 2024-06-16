# frozen_string_literal: true

class AddCommandsCountToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :commands_count, :integer
    add_column :commands, :results_count, :integer

    Event.find_each do |event|
      Event.reset_counters(event.id, :commands)
    end

    Command.find_each do |command|
      Command.reset_counters(command.id, :results)
    end
  end
end
