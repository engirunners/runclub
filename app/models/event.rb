# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :athletes, through: :results

  def self.ransackable_associations(_auth_object = nil)
    %w[athletes results]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id created_at date description name updated_at]
  end
end
