# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_many :results, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [90, 130]
    attachable.variant :web, resize_to_fill: [360, 520], preprocessed: true
  end

  validates :first_name, :last_name, presence: true

  scope :active, -> { where(exit_date: nil) }

  enum :gender, { male: 0, female: 1 }, validate: { allow_nil: false }

  def name
    "#{first_name} #{last_name}"
  end
end
