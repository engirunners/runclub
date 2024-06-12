# frozen_string_literal: true

class MakeNicknameRequiredInAthletes < ActiveRecord::Migration[7.1]
  def change
    change_column_null :athletes, :nickname, false
  end
end
