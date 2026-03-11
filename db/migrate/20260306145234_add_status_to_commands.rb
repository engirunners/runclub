class AddStatusToCommands < ActiveRecord::Migration[7.2]
  def change
     add_column :commands, :status, :integer, null: false, default: 0
  end
end
