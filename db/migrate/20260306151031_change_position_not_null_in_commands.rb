class ChangePositionNotNullInCommands < ActiveRecord::Migration[7.2]
  def change
      change_column_null :commands, :position, true
  end
end
