# frozen_string_literal: true

class AddNicknameToAthletes < ActiveRecord::Migration[7.1]
  def change
    add_column :athletes, :nickname, :string
    add_index :athletes, :nickname, unique: true
  end
end
