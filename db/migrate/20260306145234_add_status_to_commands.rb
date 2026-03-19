# frozen_string_literal: true

class AddStatusToCommands < ActiveRecord::Migration[7.2]
  def up
    change_table :commands, bulk: true do |t|
      t.column :status, :integer, null: false, default: 0
      t.column :note, :string
      t.change :position, :integer, null: true
    end
  end

  def down
    change_column_null :commands, :position, false, 100

    change_table :commands, bulk: true do |t|
      t.remove :note
      t.remove :status
    end
  end
end
