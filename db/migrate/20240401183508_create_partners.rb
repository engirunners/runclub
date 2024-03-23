# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[7.1]
  def change
    create_table :partners do |t|
      t.string :name, null: false
      t.string :link, null: false

      t.timestamps
    end
  end
end
