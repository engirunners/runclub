# frozen_string_literal: true

class AddTypeToResults < ActiveRecord::Migration[7.2]
  def change
    add_column :results, :kind, :integer, null: false, default: 0
  end
end
