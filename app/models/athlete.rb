# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_many :results, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [250, 250], preprocessed: true
    attachable.variant :web, resize_to_fill: [800, 800], preprocessed: true
  end

  validates :first_name, :last_name, presence: true
  validates :nickname, uniqueness: true, format: { with: /\A[a-z_-]{3,}\z/ }, presence: true
  validates :birth_date, presence: true, unless: :hide_birth_date

  scope :active, -> { where(exit_date: nil) }

  enum :gender, { male: 0, female: 1 }, validate: { allow_nil: false }

  def name
    "#{first_name} #{last_name}"
  end
end
