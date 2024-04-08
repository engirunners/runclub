# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.date :date
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
