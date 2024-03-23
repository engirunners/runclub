# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :web, resize_to_limit: [400, 400], preprocessed: true
  end

  validates :first_name, :last_name, presence: true

  enum :gender, { male: 0, female: 1 }, validate: { allow_nil: false }

  def self.ransackable_attributes(_auth_object = nil)
    %w[first_name last_name gender created_at email]
  end

  def name
    "#{first_name} #{last_name}"
  end
end
