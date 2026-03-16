class AddStatusToCommands < ActiveRecord::Migration[7.2]
  def change
    add_column :commands, :status, :integer, null: false, default: 0
    change_column_null :commands, :position, true
    add_column :commands, :note, :string
  end
end
