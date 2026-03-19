# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :commands, -> { order(:status, :position, :position_abs) }, dependent: :destroy, inverse_of: :event

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 150], preprocessed: true
    attachable.variant :web, resize_to_fill: [1090, 774], preprocessed: true
  end

  validates :name, :date, presence: true

  enum :kind, { road: 0, tri: 1, track: 2, trail: 3, ski: 4, swim: 5, bike: 6 }, default: 0, validate: { allow_nil: false }

  scope :visible, -> { where(hidden: false) }
end
