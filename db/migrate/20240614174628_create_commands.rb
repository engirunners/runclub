# frozen_string_literal: true

class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :commands do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.time :total_time
      t.integer :category, default: 0, null: false
      t.string :form
      t.integer :position, default: 1, null: false
      t.integer :places_overall
      t.integer :position_abs
      t.integer :places_category

      t.timestamps
    end

    add_reference :results, :command, foreign_key: true, index: false
    add_index :results, %i[command_id stage], unique: true

    Event.find_each do |event|
      command = event.commands.create!(
        event.attributes.slice(
          'total_time', 'category', 'form', 'position', 'places_overall', 'position_abs', 'places_category',
        ),
      )
      event.results.find_each do |result|
        result.update!(command:)
      end
    end

    change_column_null :results, :command_id, false
    remove_reference :results, :event, index: true

    # rubocop:disable Rails/ReversibleMigration
    change_table :events, bulk: true do |t|
      t.remove :total_time
      t.remove :category
      t.remove :form
      t.remove :position
      t.remove :places_overall
      t.remove :position_abs
      t.remove :places_category
    end
    # rubocop:enable Rails/ReversibleMigration
  end
end
