# frozen_string_literal: true

class ChangeNameAndDateNotNullInEvents < ActiveRecord::Migration[7.1]
  def change
    change_column_null :events, :name, false
    change_column_null :events, :date, false
  end
end
