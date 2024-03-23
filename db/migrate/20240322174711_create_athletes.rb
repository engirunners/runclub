# frozen_string_literal: true

class CreateAthletes < ActiveRecord::Migration[7.1]
  def change
    create_table :athletes do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birth_date
      t.integer :gender, null: false
      t.string :phone
      t.string :email
      t.string :telegram_name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
