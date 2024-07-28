# frozen_string_literal: true

class ChangeNameAndDateNotNullInEvents < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/NotNullColumn
    change_table :events, bulk: true do |t|
      t.column :name, null: false
      t.column :date, null: false
    end
    # rubocop:enable Rails/NotNullColumn
  end
end
