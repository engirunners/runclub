# frozen_string_literal: true

class AddInstagramAndTelegramLinksToAthletes < ActiveRecord::Migration[7.2]
  def change
    change_table :athletes, bulk: true do |t|
      t.column :instagram_link, :string
      t.column :telegram_link, :string
    end
  end
end
