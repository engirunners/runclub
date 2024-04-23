# frozen_string_literal: true

class AddColumnsToEvents < ActiveRecord::Migration[7.1]
  def change
    change_table :events, bulk: true do |t|
      t.column :position_abs, :integer
      t.column :places_category, :integer
    end
  end
end
