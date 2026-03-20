# frozen_string_literal: true

class Command < ApplicationRecord
  belongs_to :event, counter_cache: true
  has_many :results, dependent: :destroy
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 150], preprocessed: true
    attachable.variant :web, resize_to_fill: [640, 360], preprocessed: true
  end

  validates :name, presence: true
  validates :position, :position_abs, absence: true, unless: :ok?
  validates :position, :position_abs, presence: true, if: :ok?
  validates :position, :position_abs, :places_category, :places_overall, 
            numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :fractional_second, numericality: { only_integer: true, in: 0..99 }, allow_nil: true

  enum :category, { mf: 0, mm: 1, ff: 2 }, validate: { allow_nil: false }
  enum :status, { ok: 0, dnf: 1, dq: 2 }, default: 0, validate: { allow_nil: false }

end