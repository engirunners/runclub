# frozen_string_literal: true

class RefactorScheme < ActiveRecord::Migration[7.1]
  def up
    change_table :athletes, bulk: true do |t|
      t.remove :phone
      t.remove :telegram_name
      t.remove :description
      t.remove :location
      t.remove :email
      t.column :debut_date, :date
      t.column :exit_date, :date
      t.column :parkrun_link, :string
      t.column :fiveverst_link, :string
      t.column :s95_link, :string
      t.column :probeg_link, :string
    end

    change_table :events, bulk: true do |t|
      t.column :location, :string
      t.column :total_time, :time
      t.column :category, :integer, null: false, default: 0
      t.column :form, :string
      t.column :position, :integer, null: false, default: 1
      t.column :places_overall, :integer
      t.remove :description
    end

    change_table :results, bulk: true do |t|
      t.remove :personal_best
      t.rename :position, :stage
      t.index %i[event_id stage], unique: true
      t.remove_index :event_id
    end

    drop_table :photos
  end

  def down
    change_table :athletes, bulk: true do |t|
      t.column :phone, :string
      t.column :telegram_name, :string
      t.column :description, :text
      t.column :location, :string
      t.column :email, :string
      t.remove :debut_date
      t.remove :exit_date
      t.remove :parkrun_link
      t.remove :fiveverst_link
      t.remove :s95_link
      t.remove :probeg_link
    end

    change_table :events, bulk: true do |t|
      t.remove :location
      t.remove :total_time
      t.remove :category
      t.remove :form
      t.remove :places_overall
      t.remove :position
      t.column :description, :text
    end

    change_table :results, bulk: true do |t|
      t.boolean :personal_best, null: false, default: false
      t.remove_index %i[event_id stage]
      t.rename :stage, :position
      t.index :event_id
    end

    create_table :photos, &:timestamps
  end
end
