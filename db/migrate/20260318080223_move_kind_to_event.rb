class MoveKindToEvent < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :kind, :integer, null: false, default: 0
    remove_column  :commands, :kind
  end
end
