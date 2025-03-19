# frozen_string_literal: true

class AddHiddenToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :hidden, :boolean, null: false, default: false
  end
end
