# frozen_string_literal: true

class ChangeNameNotNullInCommands < ActiveRecord::Migration[7.1]
  def change
    change_column_null :commands, :name, false
  end
end
