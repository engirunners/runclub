# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :results, dependent: :destroy

  validates :position, numericality: { greater_than_or_equal_to: 1 }, presence: true

  enum :category, { mf: 0, mm: 1, ff: 2 }, validate: { allow_nil: false }

  def self.ransackable_attributes(_auth_object = nil)
    %w[id created_at date location category form name total_time position places_overall updated_at]
  end
end
