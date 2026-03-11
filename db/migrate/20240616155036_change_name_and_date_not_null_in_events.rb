# frozen_string_literal: true

class ChangeNameAndDateNotNullInEvents < ActiveRecord::Migration[7.1]
  def change
    change_table :events, bulk: true do |t|
      t.change_null :name, false
      t.change_null :date, false
    end
  end
end
