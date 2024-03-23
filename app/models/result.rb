# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :event

  def self.ransackable_attributes(_auth_object = nil)
    %w[id athlete_id created_at event_id personal_best position total_time distance updated_at]
  end
end
