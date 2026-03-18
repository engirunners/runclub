# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :commands, -> { order(:status, :position, :position_abs) }, dependent: :destroy, inverse_of: :event

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 150], preprocessed: true
    attachable.variant :web, resize_to_fill: [1090, 774], preprocessed: true
  end

  validates :name, :date, presence: true

  scope :visible, -> { where(hidden: false) }
end
