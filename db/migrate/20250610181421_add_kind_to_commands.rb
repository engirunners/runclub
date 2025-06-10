# frozen_string_literal: true

class AddKindToCommands < ActiveRecord::Migration[7.2]
  def change
    add_column :commands, :kind, :integer, null: false, default: 0
  end
end
