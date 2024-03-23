# frozen_string_literal: true

class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
