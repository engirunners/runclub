# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.belongs_to :athlete, null: false, foreign_key: true
      t.belongs_to :event, null: false, foreign_key: true
      t.time :total_time
      t.float :distance
      t.boolean :personal_best, null: false, default: false
      t.integer :position

      t.timestamps
    end
  end
end
