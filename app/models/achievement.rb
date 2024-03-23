# frozen_string_literal: true

class Achievement < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[description title]
  end
end
