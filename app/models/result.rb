# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :event

  validates :distance, numericality: { greater_than_or_equal_to: 0.1 }
  validates :stage, numericality: { greater_than_or_equal_to: 1 }, uniqueness: { scope: :event_id }

  def self.ransackable_attributes(_auth_object = nil)
    %w[id athlete_id created_at event_id stage total_time distance updated_at]
  end
end
